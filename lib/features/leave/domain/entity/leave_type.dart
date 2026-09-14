import 'package:equatable/equatable.dart';

class LeaveType extends Equatable {
  final int id;
  final String name;
  final String? code;
  final String? description;
  final int daysPerYear;
  final bool isPaid;
  final bool requiresApproval;
  final bool isActive;
  final int? maxConsecutiveDays;

  const LeaveType({
    required this.id,
    required this.name,
    this.code,
    this.description,
    required this.daysPerYear,
    required this.isPaid,
    this.requiresApproval = true,
    required this.isActive,
    this.maxConsecutiveDays,
  });

  static const empty = LeaveType(id: 0, name: '', daysPerYear: 0, isPaid: false, isActive: true);

  @override
  List<Object?> get props =>
      [id, name, code, description, daysPerYear, isPaid, requiresApproval, isActive, maxConsecutiveDays];
}