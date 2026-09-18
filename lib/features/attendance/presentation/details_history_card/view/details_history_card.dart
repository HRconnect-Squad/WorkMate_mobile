import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:workmate/core/presentation/design_system/theme/helper/theme_extention.dart';

import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../utils/duration_format_utils.dart';
import '../logic/details_history_card_cubit.dart';
import '../logic/details_history_card_state.dart';
import 'selfie_attendance_card.dart';

class DetailsHistoryCard extends StatefulWidget {
  final String attendanceId;

  const DetailsHistoryCard({super.key, required this.attendanceId});

  @override
  State<DetailsHistoryCard> createState() => _DetailsHistoryCardState();
}

class _DetailsHistoryCardState extends State<DetailsHistoryCard> {
  final GlobalKey _captureKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<DetailsHistoryCardCubit>().loadDetailsById(widget.attendanceId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsHistoryCardCubit, DetailsHistoryCardState>(
      listener: (context, state) {
        if (state.pdfExportSuccess) {
          SnackBarHelper.showSuccess(context, 'PDF Downloaded Successfully!');        }
        if (state.pdfError != null) {
           SnackBarHelper.showError(context, state.pdfError!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colors.gray50,
          appBar: CustomAppBar(
            title: "Details",
            backgroundColor: context.colors.white,
            showBackButton: true,
            leadingBackgroundColor: context.colors.purple50,
          ),
          body: _buildBody(context, state),
          bottomNavigationBar:
          state.hasData ? _buildExportButton(context, state) : null,
        );
      },
    );
  }


  Widget _buildExportButton(BuildContext context, DetailsHistoryCardState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: context.colors.white),
      child: SafeArea(
        child: CustomPrimaryButton.gradient(
          height: 52,
          textStyle: context.textTheme.labelLargeFont.copyWith(
            color: context.colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          buttonText: state.isExportingPdf ? 'Exporting...' : 'Export As PDF',
          borderRadius: 100,
          onPressed: state.isExportingPdf
              ? null
              : () => context.read<DetailsHistoryCardCubit>().exportToPdf(_captureKey),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, DetailsHistoryCardState state) {
    if (state.isLoading && !state.hasData) {
      return Center(
        child: CircularProgressIndicator(color: context.colors.purple500),
      );
    }

    if (state.apiError != null && !state.hasData) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: context.colors.error),
            const SizedBox(height: 12),
            Text(state.apiError!,
                textAlign: TextAlign.center,
                style: TextStyle(color: context.colors.gray600)),
            const SizedBox(height: 16),
            CustomPrimaryButton.gradient(
              height: 44,
              buttonText: 'Retry',
              borderRadius: 100,
              onPressed: () => context
                  .read<DetailsHistoryCardCubit>()
                  .loadDetailsById(widget.attendanceId),
            ),
          ],
        ),
      );
    }

    if (!state.hasData) return const SizedBox.shrink();

    return _DetailsBody(state: state, captureKey: _captureKey);
  }
}

class _DetailsBody extends StatelessWidget {
  final DetailsHistoryCardState state;
  final GlobalKey captureKey;

  const _DetailsBody({required this.state, required this.captureKey});

  @override
  Widget build(BuildContext context) {
    final details = state.details!;
    final formattedTimestamp = DurationFormatUtils.dateAndTimeToOverlayFormat(
      details.date,
      details.checkIn.time,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: RepaintBoundary(
        key: captureKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelfieAttendanceCard(
              label: 'Selfie Clock In',
              detailsHistoryCardState: state,
              imageUrl: details.proofImage ?? '',
              location: details.checkIn.location,
              timestamp: formattedTimestamp,
            ),
          ],
        ),
      ),
    );
  }
}
