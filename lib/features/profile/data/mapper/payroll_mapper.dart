import '../../../../core/data/util/parsing.dart';
import '../../domain/entity/payroll.dart';
import '../datasource/remote/dto/payroll_dto.dart';

class PayrollMapper {
  PayrollMapper._();

  static Payroll toDomain(PayrollDto dto) {
    return Payroll(
      id: dto.id ?? 0,
      month: dto.month ?? 0,
      year: dto.year ?? 0,
      basicSalary: dto.basicSalary ?? 0.0,
      allowances: dto.allowances,
      bonuses: dto.bonuses,
      overtimePay: dto.overtimePay ?? 0.0,
      deductions: dto.deductions ?? 0.0,
      tax: dto.tax,
      netSalary: dto.netSalary ?? 0.0,
      workingDays: dto.workingDays,
      presentDays: dto.presentDays,
      absentDays: dto.absentDays,
      totalHours: dto.totalHours,
      status: dto.status ?? 'pending',
      paymentDate: DataFormat.parseDate(dto.paymentDate),
      paymentMethod: dto.paymentMethod,
    );
  }

  static List<Payroll> toDomainList(List<PayrollDto> dtos) {
    return dtos.map((dto) => toDomain(dto)).toList();
  }
}