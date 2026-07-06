import 'package:easy_localization/easy_localization.dart';
import 'package:workmate/features/profile/presentation/payroll/logic/payroll_state.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/entity/payroll.dart';
import '../../../domain/usecase/get_payroll_history_usecase.dart';

class PayrollCubit extends BaseCubit<PayrollState> {
  final GetPayrollHistoryUseCase _getPayrollHistoryUseCase;

  PayrollCubit({
    required GetPayrollHistoryUseCase getPayrollHistoryUseCase,
  })  : _getPayrollHistoryUseCase = getPayrollHistoryUseCase,
        super(const PayrollState());

  Future<void> loadPayrollHistory() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoadingHistory: true,
        clearError: true,
      )),
      call: () => _getPayrollHistoryUseCase(),
      onSuccess: (payrollList) {
        updateState((s) => s.copyWith(
          isLoadingHistory: false,
          payrollHistory: payrollList,
        ));
      },
      onError: (error) {
        updateState((s) => s.copyWith(
          isLoadingHistory: false,
          error: error.message,
        ));
      },
    );
  }

  void selectPayroll(Payroll payroll) {
    updateState((s) => s.copyWith(selectedPayroll: payroll));
  }

  Future<void> exportAsPdf() async {
    if (state.selectedPayroll == null) return;

    updateState((s) => s.copyWith(isExportingPdf: true, clearError: true));

    try {
      // TODO: Implement PDF generation logic
      // For now, simulate a delay
      await Future.delayed(const Duration(seconds: 1));

      updateState((s) => s.copyWith(
        isExportingPdf: false,
        exportSuccess: 'pdf_saved_successfully'.tr(),
      ));
    } catch (e) {
      updateState((s) => s.copyWith(
        isExportingPdf: false,
        error: 'pdf_export_failed'.tr(),
      ));
    }
  }

  void clearSelectedPayroll() {
    updateState((s) => s.copyWith(clearSelectedPayroll: true));
  }

  void clearError() {
    updateState((s) => s.copyWith(clearError: true));
  }

  void clearExportSuccess() {
    updateState((s) => s.copyWith(clearExportSuccess: true));
  }

  Future<void> refreshHistory() async {
    await loadPayrollHistory();
  }
}