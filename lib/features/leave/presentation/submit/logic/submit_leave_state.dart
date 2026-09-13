import 'package:equatable/equatable.dart';

import '../../../../../core/data/util/parsing.dart';
import '../../../domain/entity/leave_type.dart';

class SubmitLeaveState extends Equatable {
  final List<LeaveType> leaveTypes;
  final bool isLoadingLeaveTypes;
  final LeaveType? selectedLeaveType;
  final DateTime? startDate;
  final DateTime? endDate;
  final String emergencyContact; // workaround: sent as `attachment`
  final String description;

  final String? leaveTypeError;
  final String? dateError;
  final String? descriptionError;

  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const SubmitLeaveState({
    this.leaveTypes = const [],
    this.isLoadingLeaveTypes = false,
    this.selectedLeaveType,
    this.startDate,
    this.endDate,
    this.emergencyContact = '',
    this.description = '',
    this.leaveTypeError,
    this.dateError,
    this.descriptionError,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  bool get hasDateRange => startDate != null && endDate != null;

  int get totalDays => hasDateRange ? endDate!.difference(startDate!).inDays + 1 : 0;

  String get formattedDateRange => hasDateRange
      ? '${DataFormat.formatDate(startDate!)} - ${DataFormat.formatDate(endDate!)}'
      : '';

  SubmitLeaveState copyWith({
    List<LeaveType>? leaveTypes,
    bool? isLoadingLeaveTypes,
    LeaveType? selectedLeaveType,
    DateTime? startDate,
    DateTime? endDate,
    String? emergencyContact,
    String? description,
    String? leaveTypeError,
    String? dateError,
    String? descriptionError,
    bool? isLoading,
    bool? isSuccess,
    String? error,
    bool clearLeaveTypeError = false,
    bool clearDateError = false,
    bool clearDescriptionError = false,
    bool clearAllErrors = false,
    bool clearError = false,
    bool clearStartDate = false,
    bool clearEndDate = false,
  }) {
    return SubmitLeaveState(
      leaveTypes: leaveTypes ?? this.leaveTypes,
      isLoadingLeaveTypes: isLoadingLeaveTypes ?? this.isLoadingLeaveTypes,
      selectedLeaveType: selectedLeaveType ?? this.selectedLeaveType,
      startDate: clearStartDate ? null : (startDate ?? this.startDate),
      endDate: clearEndDate ? null : (endDate ?? this.endDate),
      emergencyContact: emergencyContact ?? this.emergencyContact,
      description: description ?? this.description,
      leaveTypeError: (clearLeaveTypeError || clearAllErrors) ? null : (leaveTypeError ?? this.leaveTypeError),
      dateError: (clearDateError || clearAllErrors) ? null : (dateError ?? this.dateError),
      descriptionError: (clearDescriptionError || clearAllErrors) ? null : (descriptionError ?? this.descriptionError),
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [
    leaveTypes, isLoadingLeaveTypes, selectedLeaveType, startDate, endDate,
    emergencyContact, description, leaveTypeError, dateError, descriptionError,
    isLoading, isSuccess, error,
  ];
}