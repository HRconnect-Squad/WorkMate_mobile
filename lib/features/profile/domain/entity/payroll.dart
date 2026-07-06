import 'package:equatable/equatable.dart';

class Payroll extends Equatable {
  final int id;
  final int month;
  final int year;
  final double basicSalary;
  final double? allowances;
  final double? bonuses;
  final double overtimePay;
  final double deductions;
  final double? tax;
  final double netSalary;
  final int? workingDays;
  final int? presentDays;
  final int? absentDays;
  final double? totalHours;
  final String status;
  final DateTime? paymentDate;
  final String? paymentMethod;

  static const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
  ];

  const Payroll({
    required this.id,
    required this.month,
    required this.year,
    required this.basicSalary,
    this.allowances,
    this.bonuses,
    required this.overtimePay,
    required this.deductions,
    this.tax,
    required this.netSalary,
    this.workingDays,
    this.presentDays,
    this.absentDays,
    this.totalHours,
    required this.status,
    this.paymentDate,
    this.paymentMethod,
  });

  /// Computed year-month: "2026-02"
  String get yearMonth => '$year-${month.toString().padLeft(2, '0')}';

  /// Formatted month display: "Feb 2026"
  String get formattedYearMonth {
    if (month < 1 || month > 12) return '$month $year';
    return '${months[month - 1]} $year';
  }

  /// Formatted payment date: "28 Feb 2026"
  String get formattedPaymentDate {
    if (paymentDate == null) return '-';
    return '${paymentDate!.day} ${months[paymentDate!.month - 1]} ${paymentDate!.year}';
  }

  /// Formatted salary: "$9,875.00"
  String get formattedNetSalary => '\$${netSalary.toStringAsFixed(2)}';

  String get formattedBasicSalary => '\$${basicSalary.toStringAsFixed(2)}';

  String get formattedOvertimePay => '\$${overtimePay.toStringAsFixed(2)}';

  String get formattedDeductions => '\$${deductions.toStringAsFixed(2)}';

  String? get formattedTax {
    if (tax == null) return null;
    return '\$${tax!.toStringAsFixed(2)}';
  }

  String? get formattedAllowances {
    if (allowances == null) return null;
    return '\$${allowances!.toStringAsFixed(2)}';
  }

  String? get formattedBonuses {
    if (bonuses == null) return null;
    return '\$${bonuses!.toStringAsFixed(2)}';
  }

  /// Formatted total hours: "152:30 Hrs"
  String get formattedTotalHours {
    if (totalHours == null) return '00:00 Hrs';
    final hours = totalHours!.floor();
    final minutes = ((totalHours! - hours) * 60).round();
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} Hrs';
  }

  /// Attendance summary: "19/20 days"
  String? get formattedAttendance {
    if (presentDays == null || workingDays == null) return null;
    return '$presentDays/$workingDays days';
  }

  /// Paid period derived from month/year: "1 Feb 2026 - 28 Feb 2026"
  String get formattedPaidPeriod {
    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 0);
    return '${start.day} ${months[start.month - 1]} ${start.year} - '
        '${end.day} ${months[end.month - 1]} ${end.year}';
  }

  bool get isPaid => status.toLowerCase() == 'paid';

  bool get isPending => status.toLowerCase() == 'pending';

  @override
  List<Object?> get props => [
    id,
    month,
    year,
    basicSalary,
    allowances,
    bonuses,
    overtimePay,
    deductions,
    tax,
    netSalary,
    workingDays,
    presentDays,
    absentDays,
    totalHours,
    status,
    paymentDate,
    paymentMethod,
  ];
}