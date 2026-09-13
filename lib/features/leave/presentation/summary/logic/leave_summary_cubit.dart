import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/entity/leave.dart';
import '../../../domain/entity/leave_status.dart';
import '../../../domain/usecase/cancel_leave_request_usecase.dart';
import '../../../domain/usecase/get_leave_balance_usecase.dart';
import '../../../domain/usecase/get_my_leave_requests_usecase.dart';
import '../../mapper/leave_failure_ui_mapper.dart';
import 'leave_summary_state.dart';

class LeaveSummaryCubit extends BaseCubit<LeaveSummaryState> {
  final GetLeaveBalanceUseCase _getLeaveBalanceUseCase;
  final GetMyLeaveRequestsUseCase _getMyLeaveRequestsUseCase;
  final CancelLeaveRequestUseCase _cancelLeaveRequestUseCase;

  LeaveSummaryCubit({
    required GetLeaveBalanceUseCase getLeaveBalanceUseCase,
    required GetMyLeaveRequestsUseCase getMyLeaveRequestsUseCase,
    required CancelLeaveRequestUseCase cancelLeaveRequestUseCase,
  })  : _getLeaveBalanceUseCase = getLeaveBalanceUseCase,
        _getMyLeaveRequestsUseCase = getMyLeaveRequestsUseCase,
        _cancelLeaveRequestUseCase = cancelLeaveRequestUseCase,
        super(const LeaveSummaryState());

  Future<void> loadSummary() async {
    await Future.wait([loadBalance(), loadRequests(state.selectedStatus)]);
  }

  Future<void> loadBalance() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoadingBalance: true, clearError: true)),
      call: () => _getLeaveBalanceUseCase(),
      onSuccess: (balance) => updateState((s) => s.copyWith(isLoadingBalance: false, balance: balance)),
      onError: (failure) => updateState((s) => s.copyWith(
        isLoadingBalance: false,
        error: LeaveFailureUiMapper.map(failure),
      )),
    );
  }

  Future<void> onTabChanged(LeaveStatus status) async {
    updateState((s) => s.copyWith(selectedStatus: status));
    if (!state.hasLoadedCurrentTab) {
      await loadRequests(status);
    }
  }

  Future<void> loadRequests(LeaveStatus status) async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoadingRequests: true, clearError: true)),
      call: () => _getMyLeaveRequestsUseCase(status: status),
      onSuccess: (requests) => updateState((s) {
        final updated = Map<LeaveStatus, List<Leave>>.from(s.requestsByStatus)
          ..[status] = requests;
        return s.copyWith(isLoadingRequests: false, requestsByStatus: updated);
      }),
      onError: (failure) => updateState((s) => s.copyWith(
        isLoadingRequests: false,
        error: LeaveFailureUiMapper.map(failure),
      )),
    );
  }

  Future<void> cancelRequest(int id) async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(isLoadingRequests: true, clearError: true)),
      call: () => _cancelLeaveRequestUseCase(id),
      onSuccess: (_) async {
        updateState((s) => s.copyWith(requestsByStatus: const {}));
        await loadSummary();
      },
      onError: (failure) => updateState((s) => s.copyWith(
        isLoadingRequests: false,
        error: LeaveFailureUiMapper.map(failure),
      )),
    );
  }

  Future<void> refresh() async {
    updateState((s) => s.copyWith(requestsByStatus: const {}));
    await loadSummary();
  }

  void clearError() => updateState((s) => s.copyWith(clearError: true));
}