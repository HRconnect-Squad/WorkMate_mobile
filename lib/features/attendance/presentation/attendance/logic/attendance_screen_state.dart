import '../../../../../../core/presentation/design_system/model/history_card_model.dart';

enum AttendanceStatus {
  notClockedIn,
  clockedIn,
  onBreak,
  clockedOut,
}

class AttendanceScreenState {
  final bool isLoading;
  final String? apiError;
  final String todayWorkingHours;
  final String payPeriodWorkingHours;
  final AttendanceStatus attendanceStatus;
  final String? checkInTime;
  final String? checkOutTime;
  final bool hasActiveBreak;
  final double totalBreakHours;
  final String? proofImageUrl;
  final List<HistoryCardModel> historyAttendanceCard;

  const AttendanceScreenState({
    this.isLoading = false,
    this.apiError,
    this.todayWorkingHours = '00:00',
    this.payPeriodWorkingHours = '00:00',
    this.attendanceStatus = AttendanceStatus.notClockedIn,
    this.checkInTime,
    this.checkOutTime,
    this.hasActiveBreak = false,
    this.totalBreakHours = 0.0,
    this.proofImageUrl,
    this.historyAttendanceCard = const [],
  });

  bool get isClockedIn => attendanceStatus == AttendanceStatus.clockedIn;
  bool get isOnBreak => attendanceStatus == AttendanceStatus.onBreak;
  bool get isClockedOut => attendanceStatus == AttendanceStatus.clockedOut;
  bool get isNotClockedIn => attendanceStatus == AttendanceStatus.notClockedIn;

  AttendanceScreenState copyWith({
    bool? isLoading,
    String? apiError,
    bool clearApiError = false,
    String? todayWorkingHours,
    String? payPeriodWorkingHours,
    AttendanceStatus? attendanceStatus,
    String? checkInTime,
    String? checkOutTime,
    bool? hasActiveBreak,
    double? totalBreakHours,
    String? proofImageUrl,
    List<HistoryCardModel>? historyAttendanceCard,
  }) {
    return AttendanceScreenState(
      isLoading: isLoading ?? this.isLoading,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
      todayWorkingHours: todayWorkingHours ?? this.todayWorkingHours,
      payPeriodWorkingHours:
          payPeriodWorkingHours ?? this.payPeriodWorkingHours,
      attendanceStatus: attendanceStatus ?? this.attendanceStatus,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      hasActiveBreak: hasActiveBreak ?? this.hasActiveBreak,
      totalBreakHours: totalBreakHours ?? this.totalBreakHours,
      proofImageUrl: proofImageUrl ?? this.proofImageUrl,
      historyAttendanceCard:
          historyAttendanceCard ?? this.historyAttendanceCard,
    );
  }
}
