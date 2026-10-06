import 'package:equatable/equatable.dart';
import '../../../profile/domain/entity/employee_profile.dart';
import '../../../task/domain/entity/task_entity.dart';
import '../../domain/entity/meeting.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? error;

  final EmployeeProfile? profile;
  final int unreadMessages;
  final int unreadNotifications;
  final List<Meeting> meetings;
  final List<TaskEntity> tasks;

  final int taskCount;

  const HomeState({
    this.isLoading = true,
    this.error,
    this.profile,
    this.unreadMessages = 0,
    this.unreadNotifications = 0,
    this.meetings = const [],
    this.tasks = const [],
    this.taskCount = 0,
  });

  HomeState copyWith({
    bool? isLoading,
    String? error,
    bool clearError = false,
    EmployeeProfile? profile,
    int? unreadMessages,
    int? unreadNotifications,
    List<Meeting>? meetings,
    List<TaskEntity>? tasks,
    int? taskCount,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      profile: profile ?? this.profile,
      unreadMessages: unreadMessages ?? this.unreadMessages,
      unreadNotifications: unreadNotifications ?? this.unreadNotifications,
      meetings: meetings ?? this.meetings,
      tasks: tasks ?? this.tasks,
      taskCount: taskCount ?? this.taskCount,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    error,
    profile,
    unreadMessages,
    unreadNotifications,
    meetings,
    tasks,
    taskCount,
  ];
}
