import 'package:equatable/equatable.dart';

import '../../../domain/entity/payroll.dart';

class PayrollState extends Equatable {
  final List<Payroll> payrollHistory;
  final Payroll? selectedPayroll;
  final bool isLoadingHistory;
  final bool isExportingPdf;
  final String? error;
  final String? exportSuccess;

  const PayrollState({
    this.payrollHistory = const [],
    this.selectedPayroll,
    this.isLoadingHistory = false,
    this.isExportingPdf = false,
    this.error,
    this.exportSuccess,
  });

  bool get hasPayrollData => payrollHistory.isNotEmpty;

  PayrollState copyWith({
    List<Payroll>? payrollHistory,
    Payroll? selectedPayroll,
    bool? isLoadingHistory,
    bool? isLoadingDetails,
    bool? isExportingPdf,
    String? error,
    String? exportSuccess,
    bool clearError = false,
    bool clearSelectedPayroll = false,
    bool clearExportSuccess = false,
  }) {
    return PayrollState(
      payrollHistory: payrollHistory ?? this.payrollHistory,
      selectedPayroll: clearSelectedPayroll ? null : (selectedPayroll ?? this.selectedPayroll),
      isLoadingHistory: isLoadingHistory ?? this.isLoadingHistory,
      isExportingPdf: isExportingPdf ?? this.isExportingPdf,
      error: clearError ? null : (error ?? this.error),
      exportSuccess: clearExportSuccess ? null : (exportSuccess ?? this.exportSuccess),
    );
  }

  @override
  List<Object?> get props => [
    payrollHistory,
    selectedPayroll,
    isLoadingHistory,
    isExportingPdf,
    error,
    exportSuccess,
  ];
}