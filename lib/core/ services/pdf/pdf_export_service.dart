import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import '../../data/exception/app_exception.dart';
import '../../domain/failure/domain_failure.dart';

class PdfExportService {
  static Future<Either<Failure, String>> exportFromWidget({
    required GlobalKey captureKey,
    required String fileName,
    double pixelRatio = 3.0,
  }) async {
    try {
      final imageBytes = await _captureWidget(captureKey, pixelRatio);
      final pdfBytes = await _buildPdf(imageBytes);
      final filePath = await _saveToDevice(pdfBytes, fileName);
      return Right(filePath);
    } on FileException catch (e) {
      return Left(FileFailure(message: e.message));
    } catch (e) {
      return Left(FileFailure(message: e.toString()));
    }
  }

  // static Future<PdfExportResult> exportFromBytes({
  //   required Uint8List imageBytes,
  //   required String fileName,
  // }) async {
  //   try {
  //     final pdfBytes = await _buildPdf(imageBytes);
  //     final filePath = await _saveToDevice(pdfBytes, fileName);
  //     return PdfExportResult.success(filePath);
  //   } catch (e) {
  //     return PdfExportResult.failure(e.toString());
  //   }
  // }


  static Future<Uint8List> _captureWidget(
      GlobalKey key,
      double pixelRatio,
      ) async {
    final boundary =
    key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  static Future<Uint8List> _buildPdf(Uint8List imageBytes) async {
    final pdf = pw.Document();
    final pdfImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(16),
        build: (pw.Context ctx) => pw.Center(
          child: pw.Image(pdfImage, fit: pw.BoxFit.contain),
        ),
      ),
    );

    return pdf.save();
  }

  static Future<String> _saveToDevice(Uint8List bytes, String fileName) async {
    final status = await Permission.storage.request();
    if (status.isPermanentlyDenied) {
      throw const FileException(
        message: 'Storage permission permanently denied. Enable it from app settings.',
      );
    }
    if (status.isDenied) {
      throw const FileException(message: 'Storage permission is required to save the PDF.');
    }

    Directory? dir;
    if (Platform.isAndroid) {
      dir = Directory('/storage/emulated/0/Download');
      if (!await dir.exists()) {
        dir = await getApplicationDocumentsDirectory();
      }
    } else {
      dir = await getApplicationDocumentsDirectory();
    }

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${dir.path}/${fileName}_$timestamp.pdf');
      await file.writeAsBytes(bytes);
      return file.path;
    } catch (e) {
      throw FileException(message: 'Failed to save PDF: $e');
    }
  }
}