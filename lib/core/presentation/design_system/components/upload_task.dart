import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/helper/dashed_border_painter.dart';
import '../theme/helper/extention_colors.dart';
import '../theme/helper/running_border_painter.dart';
import '../theme/helper/theme_extention.dart';
import 'custom_primary_button.dart';

class UploadTask extends StatefulWidget {
  const UploadTask({super.key});

  @override
  State<UploadTask> createState() => _UploadTaskState();
}

class _UploadTaskState extends State<UploadTask> {
  Map<int, bool> currentCard = {};
  Map<int, double> uploadProgress = {};
  Map<int, File?> pickedFile = {};

  @override
  Widget build(BuildContext context) {
    final txtTheme = context.textTheme;
    final color = context.colors;
    final item = List.generate(3, (index) => index);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: item.map((element) {
          final isLast = element == item.length - 1;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: isLast ? 0 : 10),
              child: _buildTaskCard(color, element, txtTheme),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTaskCard(dynamic color, int index, dynamic txtTheme) {
    bool isLoading = currentCard[index] ?? false;
    double progress = uploadProgress[index] ?? 0.0;
    return Material(
      color: color.purple50,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: isLoading
            ? null
            : pickedFile[index] != null
            ? () => _showPreviewDialog(context, pickedFile[index]!, index)
            : () => _pickFile(index),
        splashColor: color.purple200.withValues(alpha: 0.3),
        highlightColor: color.purple100.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        child: CustomPaint(
          painter: isLoading
              ? RunningBorderPainter(color: color.purple500, progress: progress)
              : DashedBorderPainter(color: color.purple300, borderRadius: 8),

          child: Container(
            constraints: BoxConstraints(minHeight: 100, minWidth: 106),
            decoration: BoxDecoration(
              color: ExtensionColors.transparentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: isLoading
                ? Column(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "${(progress * 100).toInt()}%",
                        style: txtTheme.bodyLargeFont.copyWith(
                          color: color.purple500,
                        ),
                      ),
                      Text(
                        "uploading".tr(),
                        style: txtTheme.labelSmallFont.copyWith(
                          color: color.purple400,
                        ),
                      ),
                    ],
                  )
                : pickedFile[index] != null
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          pickedFile[index]!.path.split('/').last,
                          style: txtTheme.labelMediumFont.copyWith(
                            color: color.gray700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )
                : Icon(Iconsax.export_1, color: color.purple500),
          ),
        ),
      ),
    );
  }

  void _pickFile(int index) async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (!mounted) return;
    if (result != null) {
      setState(() {
        currentCard[index] = true;
        uploadProgress[index] = 0.0;
      });
      for (int i = 1; i <= 100; i++) {
        if (!mounted) return;
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          uploadProgress[index] = i / 100;
        });
      }
      setState(() {
        pickedFile[index] = File(result.files.single.path!);
        currentCard[index] = false;
      });
    }

    setState(() {
      currentCard[index] = false;
    });
  }

  void _showPreviewDialog(BuildContext context, File file, int index) {
    final String fileName = file.path.split('/').last;
    final bool isImage = [
      '.jpg',
      '.jpeg',
      '.png',
    ].any((ext) => fileName.toLowerCase().endsWith(ext));
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: .min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        fileName,
                        style: context.textTheme.labelLargeFont.copyWith(
                          color: context.colors.purple500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Iconsax.close_square5,
                        color: context.colors.error,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: context.colors.gray200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: isImage
                      ? InteractiveViewer(
                          child: Image.file(file, fit: BoxFit.contain),
                        )
                      : PDFView(
                          filePath: file.path,
                          autoSpacing: false,
                          enableSwipe: true,
                          swipeHorizontal: false,
                          pageFling: true,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomPrimaryButton.outlined(
                        buttonText: "delete".tr(),
                        textStyle: context.textTheme.bodyMediumFont.copyWith(
                          color: context.colors.error,
                        ),
                        borderWidth: 2,
                        borderColor: context.colors.error,
                        borderRadius: 20,
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        onPressed: () {
                          setState(() {
                            pickedFile[index] = null;
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: CustomPrimaryButton.outlined(
                        onPressed: () => Navigator.pop(context),
                        buttonText: "keep_file".tr(),
                        textStyle: context.textTheme.bodyMediumFont.copyWith(
                          color: context.colors.purple500,
                        ),
                        borderWidth: 2,
                        borderColor: context.colors.purple500,
                        borderRadius: 20,
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
