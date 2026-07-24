import 'package:flutter/material.dart';

import '../../../../../core/ services/pdf/pdf_export_service.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/use_case/get_attendance_details_by_id_use_case.dart';
import 'details_history_card_state.dart';

class DetailsHistoryCardCubit extends BaseCubit<DetailsHistoryCardState> {
  final GetAttendanceDetailsByIdUseCase _getDetailsUseCase;

  DetailsHistoryCardCubit({
    required GetAttendanceDetailsByIdUseCase getDetailsUseCase,
  })  : _getDetailsUseCase = getDetailsUseCase,
        super(const DetailsHistoryCardState());

  Future<void> loadDetailsById(String id) async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(isLoading: true, clearApiError: true),
      ),
      call: () => _getDetailsUseCase(id),
      onSuccess: (details) {
        updateState((s) => s.copyWith(isLoading: false, details: details));
      },
      onError: (e) {
        updateState((s) => s.copyWith(isLoading: false, apiError: e.message));
      },
    );
  }

  Future<void> exportToPdf(GlobalKey captureKey) async {
    if (!state.hasData) return;

    updateState(
          (s) => s.copyWith(
        isExportingPdf: true,
        pdfExportSuccess: false,
        clearPdfError: true,
      ),
    );

    final result = await PdfExportService.exportFromWidget(
      captureKey: captureKey,
      fileName: 'attendance_${state.details!.date}',
    );

    if (result.isSuccess) {
      _onExportSuccess(result);
    } else {
      _onExportError(result);
    }
  }

  void _onExportSuccess(dynamic result) {
    updateState((s) => s.copyWith(
      isExportingPdf: false,
      pdfExportSuccess: true,
      pdfFilePath: result.filePath,
    ));
  }

  void _onExportError(dynamic result) {
    updateState((s) => s.copyWith(
      isExportingPdf: false,
      pdfError: result.errorMessage,
    ));
  }
}