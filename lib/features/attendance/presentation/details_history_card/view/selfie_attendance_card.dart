import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:workmate/core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../utils/duration_format_utils.dart';
import '../logic/details_history_card_state.dart';
import 'attendance_stats_section.dart';

class SelfieAttendanceCard extends StatelessWidget {
  final String label;
  final String imageUrl;
  final String? location;
  final String timestamp;
  final DetailsHistoryCardState detailsHistoryCardState;
  final double height;

  const SelfieAttendanceCard({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.timestamp,
    this.location,
    required this.detailsHistoryCardState,
    this.height = 340,
  });

  bool get _isLocalFile =>
      imageUrl.startsWith('/') || imageUrl.startsWith('file://');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Column(
              children: [
                _buildDateHeader(context),
                const SizedBox(height: 16),
                _buildContentBox(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Iconsax.calendar_1,
          size: 18,
          color: context.colors.purple500,
        ),
        const SizedBox(width: 6),
        Text(
          detailsHistoryCardState.details!.date,
          style: context.textTheme.titleLargeFontSemiBold.copyWith(
            fontSize: 14,
            color: context.colors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildContentBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.gray100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel(context),
            const SizedBox(height: 4),
            _buildImageWithOverlay(context),
            const SizedBox(height: 12),
            _buildNotesSection(context),
            const SizedBox(height: 20),
            _buildStatsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      label,
      style: context.textTheme.labelMediumFont.copyWith(
        fontSize: 12,
        color: context.colors.textSecondary,
      ),
    );
  }

  Widget _buildImageWithOverlay(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(),
            _buildBottomGradientOverlay(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomGradientOverlay(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              context.colors.black.withOpacity(0.6),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (location != null && location!.isNotEmpty)
              Text(
                location!,
                style: context.textTheme.labelMediumFont.copyWith(
                  color: context.colors.white,
                ),
              ),
            Text(
              timestamp,
              style: context.textTheme.labelMediumFont.copyWith(
                color: context.colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesSection(BuildContext context) {
    final notes = detailsHistoryCardState.details?.notes;
    final hasNotes = notes?.isNotEmpty ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Clock-In Notes',
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          hasNotes ? notes! : '—',
          style: context.textTheme.labelLargeFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray900,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return AttendanceStatsSection(rows: _buildStatsRows());
  }

  List<List<AttendanceStatItemData>> _buildStatsRows() {
    final details = detailsHistoryCardState.details!;
    final hasBreaks = details.breaks.isNotEmpty;
    final firstBreak = hasBreaks ? details.breaks.first : null;

    final clockInOut =
        '${DurationFormatUtils.hhmmssToAmPm(details.checkIn.time)} — '
        '${details.checkOut != null ? DurationFormatUtils.hhmmssToAmPm(details.checkOut!.time) : '—'}';

    final breakStartEnd = hasBreaks
        ? '${DurationFormatUtils.dateTimeStringToAmPm(firstBreak!.start)} — '
        '${firstBreak.end != null ? DurationFormatUtils.dateTimeStringToAmPm(firstBreak.end) : 'ongoing'}'
        : '—';

    return [
      [
        AttendanceStatItemData(
          label: 'Total Hours',
          value: details.durations.worked.formatted,
        ),
        AttendanceStatItemData(
          label: 'Clock in & Out',
          value: clockInOut,
        ),
      ],
      [
        AttendanceStatItemData(
          label: 'Break',
          value: details.durations.breaks.formatted,
        ),
        AttendanceStatItemData(
          label: 'Take A Break & Back To Work',
          value: breakStartEnd,
        ),
      ],
    ];
  }

  Widget _buildImage() {
    if (_isLocalFile) {
      return Image.file(
        File(imageUrl.replaceFirst('file://', '')),
        fit: BoxFit.cover,
      );
    }
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (_, __, ___) => Container(
        color: Colors.grey.shade200,
        child: const Icon(
          Icons.broken_image_outlined,
          color: Colors.grey,
          size: 40,
        ),
      ),
    );
  }
}