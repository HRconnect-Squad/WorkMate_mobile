import 'package:easy_localization/easy_localization.dart';
import 'package:workmate/features/leave/presentation/submit/logic/submit_leave_state.dart';

import '../../../../../core/domain/failure/domain_failure.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/entity/leave_type.dart';
import '../../../domain/usecase/get_leave_types_usecase.dart';
import '../../../domain/usecase/submit_leave_request_usecase.dart';
import '../../mapper/leave_failure_ui_mapper.dart';

class SubmitLeaveCubit extends BaseCubit<SubmitLeaveState> {
  final GetLeaveTypesUseCase _getLeaveTypesUseCase;
  final SubmitLeaveRequestUseCase _submitLeaveRequestUseCase;

  SubmitLeaveCubit({
    required GetLeaveTypesUseCase getLeaveTypesUseCase,
    required SubmitLeaveRequestUseCase submitLeaveRequestUseCase,
  })  : _getLeaveTypesUseCase = getLeaveTypesUseCase,
        _submitLeaveRequestUseCase = submitLeaveRequestUseCase,
        super(const SubmitLeaveState());

  Future<void> loadLeaveTypes() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoadingLeaveTypes: true)),
      call: () => _getLeaveTypesUseCase(),
      onSuccess: (types) => updateState((s) => s.copyWith(
        isLoadingLeaveTypes: false,
        leaveTypes: types.where((t) => t.isActive).toList(),
      )),
      onError: (failure) => updateState((s) => s.copyWith(
        isLoadingLeaveTypes: false,
        error: LeaveFailureUiMapper.map(failure),
      )),
    );
  }

  void onLeaveTypeChanged(LeaveType type) {
    updateState((s) => s.copyWith(selectedLeaveType: type, clearLeaveTypeError: true));
  }

  void onStartDateChanged(DateTime date) {
    updateState((s) {
      final endStillValid = s.endDate != null && !s.endDate!.isBefore(date);
      return s.copyWith(
        startDate: date,
        clearEndDate: !endStillValid,
        clearDateError: true,
      );
    });
  }

  void onEndDateChanged(DateTime date) {
    updateState((s) => s.copyWith(endDate: date, clearDateError: true));
  }

  void onEmergencyContactChanged(String value) {
    updateState((s) => s.copyWith(emergencyContact: value));
  }

  void onDescriptionChanged(String value) {
    updateState((s) => s.copyWith(description: value, clearDescriptionError: true));
  }

  bool _validate() {
    bool isValid = true;

    if (state.selectedLeaveType == null) {
      updateState((s) => s.copyWith(leaveTypeError: 'leave_category_required'.tr()));
      isValid = false;
    }
    if (!state.hasDateRange) {
      updateState((s) => s.copyWith(dateError: 'leave_duration_required'.tr()));
      isValid = false;
    }
    if (state.description.trim().isEmpty) {
      updateState((s) => s.copyWith(descriptionError: 'leave_description_required'.tr()));
      isValid = false;
    }
    return isValid;
  }

  Future<void> submit() async {
    if (!_validate()) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoading: true, clearError: true)),
      call: () => _submitLeaveRequestUseCase(
        leaveTypeId: state.selectedLeaveType!.id,
        startDate: state.startDate!,
        endDate: state.endDate!,
        reason: state.description.trim(),
        // Workaround: no dedicated emergency-contact field on the backend yet,
        // so it rides along in `attachment`. Remove once backend adds a real field.
        attachmentPath: state.emergencyContact.trim().isNotEmpty ? state.emergencyContact.trim() : null,
      ),
      onSuccess: (_) => updateState((s) => s.copyWith(isLoading: false, isSuccess: true)),
      onError: (failure) {
        switch (failure) {
          case ValidationFailure(:final errors):
            final hasFieldErrors = errors?.isNotEmpty ?? false;
            updateState((s) => s.copyWith(
              isLoading: false,
              leaveTypeError: errors?.firstErrorFor('leave_type_id'),
              dateError: errors?.firstErrorFor('start_date') ?? errors?.firstErrorFor('end_date'),
              descriptionError: errors?.firstErrorFor('reason'),
              error: hasFieldErrors ? null : LeaveFailureUiMapper.map(failure),
            ));

          default:
            updateState((s) => s.copyWith(
              isLoading: false,
              error: LeaveFailureUiMapper.map(failure),
            ));
        }
      },
    );
  }

  void clearError() => updateState((s) => s.copyWith(clearError: true));
}