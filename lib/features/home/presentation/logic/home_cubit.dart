import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../core/presentation/mapper/failure_ui_mapper.dart';
import '../../../profile/domain/usecase/get_profile_usecase.dart';
import '../../../task/domain/use_cases/get_tasks_by_due_date_use_case.dart';
import '../../domain/usecase/get_today_meetings_usecase.dart';
import '../../domain/usecase/get_unread_messages_count_usecase.dart';
import '../../domain/usecase/get_unread_notifications_count_usecase.dart';
import '../../utils/cairo_clock.dart';
import 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final GetProfileUseCase _getProfileUseCase;
  final GetUnreadMessagesCountUseCase _getUnreadMessagesCountUseCase;
  final GetUnreadNotificationsCountUseCase _getUnreadNotificationsCountUseCase;
  final GetTodayMeetingsUseCase _getTodayMeetingsUseCase;
  final GetTasksByDueDateUseCase _getTasksByDueDateUseCase;

  HomeCubit({
    required GetProfileUseCase getProfileUseCase,
    required GetUnreadMessagesCountUseCase getUnreadMessagesCountUseCase,
    required GetUnreadNotificationsCountUseCase getUnreadNotificationsCountUseCase,
    required GetTodayMeetingsUseCase getTodayMeetingsUseCase,
    required GetTasksByDueDateUseCase getTasksByDueDateUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        _getUnreadMessagesCountUseCase = getUnreadMessagesCountUseCase,
        _getUnreadNotificationsCountUseCase = getUnreadNotificationsCountUseCase,
        _getTodayMeetingsUseCase = getTodayMeetingsUseCase,
        _getTasksByDueDateUseCase = getTasksByDueDateUseCase,
        super(const HomeState());

  Future<void> load() async {
    updateState((s) => s.copyWith(isLoading: true, clearError: true));

    await Future.wait([
      _loadProfile(),
      _loadUnreadMessages(),
      _loadUnreadNotifications(),
      _loadMeetings(),
    ]);

    await _loadTodayTasks();

    updateState((s) => s.copyWith(isLoading: false));
  }

  Future<void> refresh() => load();

  Future<void> _loadProfile() => execute(
    call: () => _getProfileUseCase(),
    onSuccess: (profile) => updateState((s) => s.copyWith(profile: profile)),
    onError: _onCriticalError,
  );

  Future<void> _loadUnreadMessages() => execute(
    call: () => _getUnreadMessagesCountUseCase(),
    onSuccess: (count) => updateState((s) => s.copyWith(unreadMessages: count)),
    onError: (_) {},
  );

  Future<void> _loadUnreadNotifications() => execute(
    call: () => _getUnreadNotificationsCountUseCase(),
    onSuccess: (count) =>
        updateState((s) => s.copyWith(unreadNotifications: count)),
    onError: (_) {},
  );

  Future<void> _loadMeetings() => execute(
    call: () => _getTodayMeetingsUseCase(),
    onSuccess: (meetings) => updateState((s) => s.copyWith(meetings: meetings)),
    onError: _onCriticalError,
  );

  Future<void> _loadTodayTasks() => execute(
    call: () => _getTasksByDueDateUseCase(CairoClock.todayIso()),
    onSuccess: (result) => updateState(
      (s) => s.copyWith(tasks: result.tasks, taskCount: result.taskCount),
    ),
    onError: _onCriticalError,
  );

  void _onCriticalError(Failure failure) {
    updateState(
      (s) => s.error != null
          ? s
          : s.copyWith(error: FailureUiMapper.map(failure)),
    );
  }
}
