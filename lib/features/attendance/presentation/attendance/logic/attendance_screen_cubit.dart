import 'dart:async';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/enitity/attendance_record.dart';
import '../../../domain/use_case/EndAttendanceBreakUseCase.dart';
import '../../../domain/use_case/StartAttendanceBreakUseCase.dart';
import '../../../domain/use_case/attendance_history_use_case.dart';
import '../../../domain/use_case/clock_out_attendance_use_case.dart';
import '../../../domain/use_case/get_attendance_today_use_case.dart';
import '../mapper/AttendanceHistoryMapper.dart';
import '../../attendance_notifier/attendance_notifier.dart';
import 'attendance_screen_state.dart';
import '../../utils/duration_format_utils.dart';

class AttendanceScreenCubit extends BaseCubit<AttendanceScreenState> {
  final GetAttendanceHistoryUseCase _attendanceHistoryUseCase;
  final GetTodayAttendanceUseCase _getTodayAttendanceUseCase;
  final StartAttendanceBreakUseCase _startAttendanceBreakUseCase;
  final EndAttendanceBreakUseCase _endAttendanceBreakUseCase;
  final ClockOutAttendanceUseCase _clockOutAttendanceUseCase;
  final AttendanceNotifier _attendanceNotifier;

  Timer? _liveTimer;
  DateTime? _workStartDateTime;
  int _breakOffsetSeconds = 0;

  bool _isBusy = false;

  AttendanceScreenCubit({
    required GetTodayAttendanceUseCase getTodayAttendanceUseCase,
    required GetAttendanceHistoryUseCase getAttendanceHistoryUseCase,
    required StartAttendanceBreakUseCase startAttendanceBreakUseCase,
    required EndAttendanceBreakUseCase endAttendanceBreakUseCase,
    required ClockOutAttendanceUseCase clockOutAttendanceUseCase,
    required AttendanceNotifier attendanceNotifier,
  })  : _attendanceHistoryUseCase = getAttendanceHistoryUseCase,
        _getTodayAttendanceUseCase = getTodayAttendanceUseCase,
        _startAttendanceBreakUseCase = startAttendanceBreakUseCase,
        _endAttendanceBreakUseCase = endAttendanceBreakUseCase,
        _clockOutAttendanceUseCase = clockOutAttendanceUseCase,
        _attendanceNotifier = attendanceNotifier,
        super(const AttendanceScreenState()) {
    loadTodayAttendance();
    loadAttendanceHistory();
    _attendanceNotifier.onClockInSuccess.listen((_) {
      refreshAfterClockIn();
    });
  }

  // ============================================================
  // Data loading
  // ============================================================

  Future<void> loadTodayAttendance() async {
    _isBusy = true;
    await execute(
      onLoading: () => updateState(
        (s) => s.copyWith(isLoading: true, clearApiError: true),
      ),
      call: () => _getTodayAttendanceUseCase(),
      onSuccess: (record) {
        _applyTodayRecord(record, isLoading: false);
      },
      onError: (e) {
        updateState((s) => s.copyWith(isLoading: false, apiError: e.message));
      },
    );
    _isBusy = false;
  }

  Future<void> loadAttendanceHistory() async {
    await execute(
      onLoading: () => updateState(
        (s) => s.copyWith(isLoading: true, clearApiError: true),
      ),
      call: () => _attendanceHistoryUseCase(),
      onSuccess: (history) {
        updateState((s) => s.copyWith(
              isLoading: false,
              historyAttendanceCard:
                  AttendanceHistoryMapper.toHistoryCards(history.days),
              payPeriodWorkingHours: DurationFormatUtils.hhmmssToHHMM(
                history.summary.durations.worked.formatted,
              ),
            ));
      },
      onError: (e) {
        updateState((s) => s.copyWith(isLoading: false, apiError: e.message));
      },
    );
  }

  void _applyTodayRecord(AttendanceRecord record, {required bool isLoading}) {
    updateState((s) => s.copyWith(
          isLoading: isLoading,
          attendanceStatus: _resolveStatus(record),
          checkInTime: record.hasCheckedIn
              ? DurationFormatUtils.hhmmssToHHMM(record.checkIn.time)
              : null,
          checkOutTime: record.hasCheckedOut
              ? DurationFormatUtils.hhmmssToHHMM(record.checkOut.time)
              : null,
          todayWorkingHours: DurationFormatUtils.hhmmssToHHMM(
            record.durations.worked.formatted,
          ),
          hasActiveBreak: record.hasActiveBreak,
          totalBreakHours: DurationFormatUtils.secondsToDecimalHours(
            record.durations.breaks.totalSeconds,
          ),
          proofImageUrl: record.proofImage,
        ));

    _syncLiveTimer(record);
  }

  // ============================================================
  // Actions
  // ============================================================

  Future<void> startAttendanceBreak() async {
    _isBusy = true;
    await execute(
      onLoading: () => updateState(
        (s) => s.copyWith(isLoading: true, clearApiError: true),
      ),
      call: () => _startAttendanceBreakUseCase(),
      onSuccess: (breakRecord) {
        _stopLiveTimer();
        updateState((s) => s.copyWith(
              isLoading: false,
              hasActiveBreak: breakRecord.isActive,
              attendanceStatus: AttendanceStatus.onBreak,
            ));
      },
      onError: (e) {
        updateState((s) => s.copyWith(isLoading: false, apiError: e.message));
      },
    );
    _isBusy = false;
  }

  Future<void> endAttendanceBreak() async {
    _isBusy = true;
    await execute(
      onLoading: () => updateState(
        (s) => s.copyWith(isLoading: true, clearApiError: true),
      ),
      call: () => _endAttendanceBreakUseCase(),
      onSuccess: (_) async {

        _isBusy = false;
        await loadTodayAttendance();
      },
      onError: (e) {
        updateState((s) => s.copyWith(isLoading: false, apiError: e.message));
      },
    );
    _isBusy = false;
  }

  Future<void> clockOutAttendance() async {
    _isBusy = true;
    await execute(
      onLoading: () => updateState(
        (s) => s.copyWith(isLoading: true, clearApiError: true),
      ),
      call: () => _clockOutAttendanceUseCase(),
      onSuccess: (record) {
        _stopLiveTimer();
        updateState((s) => s.copyWith(
              isLoading: false,
              attendanceStatus: AttendanceStatus.clockedOut,
              checkOutTime:
                  DurationFormatUtils.hhmmssToHHMM(record.checkOut.time),
              todayWorkingHours: DurationFormatUtils.hhmmssToHHMM(
                record.durations.worked.formatted,
              ),
            ));
        loadAttendanceHistory();
      },
      onError: (e) {
        updateState((s) => s.copyWith(isLoading: false, apiError: e.message));
      },
    );
    _isBusy = false;
  }

  void refreshAfterClockIn() {
    loadTodayAttendance();
    loadAttendanceHistory();
  }

  // ============================================================
  // Status resolution
  // ============================================================

  AttendanceStatus _resolveStatus(AttendanceRecord record) {
    if (record.hasActiveBreak) return AttendanceStatus.onBreak;

    if (record.hasCheckedOut) return AttendanceStatus.clockedOut;

    if (record.hasCheckedIn) return AttendanceStatus.clockedIn;

    return AttendanceStatus.notClockedIn;
  }

  // ============================================================
  // Live Timer
  // ============================================================

  void _syncLiveTimer(AttendanceRecord record) {
    final shouldRun = record.hasCheckedIn &&
        !record.hasCheckedOut &&
        !record.hasActiveBreak;

    if (!shouldRun) {
      _stopLiveTimer();
      return;
    }

    _breakOffsetSeconds = record.durations.breaks.totalSeconds;
    _workStartDateTime =
        DurationFormatUtils.combineWithToday(record.checkIn.time);

    _liveTimer?.cancel();
    _liveTimer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());

    _tick();
  }

  void _stopLiveTimer() {
    _liveTimer?.cancel();
    _liveTimer = null;
    _workStartDateTime = null;
    _breakOffsetSeconds = 0;
  }

  void _tick() {
    final start = _workStartDateTime;
    if (start == null) return;

    final elapsedSeconds = DateTime.now().difference(start).inSeconds;
    if (elapsedSeconds < 0) return;

    final workedSeconds = elapsedSeconds - _breakOffsetSeconds;
    if (workedSeconds < 0) return;

    updateState((s) => s.copyWith(
          todayWorkingHours:
              DurationFormatUtils.secondsToHHMM(workedSeconds),
        ));
  }

  // ============================================================
  // Dispose
  // ============================================================

  @override
  Future<void> close() {
    _stopLiveTimer();
    return super.close();
  }
}
