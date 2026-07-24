import 'package:flutter/material.dart';

import '../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../domain/enitity/attendance_record.dart';
import '../../utils/duration_format_utils.dart';
class AttendanceHistoryMapper {
  static List<HistoryCardModel> toHistoryCards(List<AttendanceRecord> days) {
    return days.map((day) {
      return HistoryCardModel(
        id: day.id.toString(),
        date: DateTime.parse(day.date),
        infoItems: [
          InfoItem(
            label: 'Total Hours',
            value: DurationFormatUtils.hhmmssToHHMM(
              day.durations.worked.formatted,
            ),
          ),
          InfoItem(
            label: 'Clock in & Out',
            value: _buildClockInOutLabel(day),
          ),
        ],
        headerIcon: Icons.check_circle,
      );
    }).toList();
  }

  static String _buildClockInOutLabel(AttendanceRecord day) {
    final inTime = day.hasCheckedIn
        ? DurationFormatUtils.hhmmssToHHMM(day.checkIn.time)
        : '--:--';
    final outTime = day.hasCheckedOut
        ? DurationFormatUtils.hhmmssToHHMM(day.checkOut.time)
        : '--:--';
    return '$inTime — $outTime';
  }
}
