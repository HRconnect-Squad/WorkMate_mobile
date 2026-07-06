class PayrollDto {
  final int? id;
  final int? month;
  final int? year;
  final double? basicSalary;
  final double? allowances;
  final double? bonuses;
  final double? overtimePay;
  final double? deductions;
  final double? tax;
  final double? netSalary;
  final int? workingDays;
  final int? presentDays;
  final int? absentDays;
  final double? totalHours;
  final String? status;
  final String? paymentDate;
  final String? paymentMethod;

  const PayrollDto({
    this.id,
    this.month,
    this.year,
    this.basicSalary,
    this.allowances,
    this.bonuses,
    this.overtimePay,
    this.deductions,
    this.tax,
    this.netSalary,
    this.workingDays,
    this.presentDays,
    this.absentDays,
    this.totalHours,
    this.status,
    this.paymentDate,
    this.paymentMethod,
  });

  factory PayrollDto.fromJson(Map<String, dynamic> json) {
    return PayrollDto(
      id: json['id'] as int?,
      month: json['month'] as int?,
      year: json['year'] as int?,
      basicSalary: (json['basic_salary'] as num?)?.toDouble(),
      allowances: (json['allowances'] as num?)?.toDouble(),
      bonuses: (json['bonuses'] as num?)?.toDouble(),
      overtimePay: (json['overtime_pay'] as num?)?.toDouble(),
      deductions: (json['deductions'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      netSalary: (json['net_salary'] as num?)?.toDouble(),
      workingDays: json['working_days'] as int?,
      presentDays: json['present_days'] as int?,
      absentDays: json['absent_days'] as int?,
      totalHours: (json['total_hours'] as num?)?.toDouble(),
      status: json['status'] as String?,
      paymentDate: json['payment_date'] as String?,
      paymentMethod: json['payment_method'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'month': month,
      'year': year,
      'basic_salary': basicSalary,
      'allowances': allowances,
      'bonuses': bonuses,
      'overtime_pay': overtimePay,
      'deductions': deductions,
      'tax': tax,
      'net_salary': netSalary,
      'working_days': workingDays,
      'present_days': presentDays,
      'absent_days': absentDays,
      'total_hours': totalHours,
      'status': status,
      'payment_date': paymentDate,
      'payment_method': paymentMethod,
    };
  }
}