import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:workmate/core/presentation/design_system/theme/helper/theme_extention.dart';

import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../../attendance/logic/attendance_screen_cubit.dart';
import '../../logic/ClockInFlowCubit.dart';
import '../../logic/ClockInFlowStatus.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClockInFlowCubit, ClockInFlowState>(
      listenWhen: (previous, current) =>
      ModalRoute.of(context)?.isCurrent == true,
      listener: (context, state) {
        if (state.isSuccess) {
          SnackBarHelper.showSuccess(context, 'Clock In Successfully'.tr());

          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              context.go(RouteNames.attendantScreen);
            }
          });
        }

        if (state.hasError && state.errorMessage != null) {
          SnackBarHelper.showError(
            context,
            state.errorMessage!,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<ClockInFlowCubit>();

        return Scaffold(
          backgroundColor: context.colors.gray50,
          appBar: CustomAppBar(
            title: "Selfie To Clock In",
            backgroundColor: context.colors.white,
            showBackButton: true,
            leadingBackgroundColor: context.colors.purple50,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: context.colors.gray200,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 440,
                          child: _buildImageCard(
                              context,
                              cubit,
                              state
                          )
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    CustomInputField(
                      contentPaddingVertical: 50,
                      label: "Clock-in Notes (Optional)".tr(),
                      labelColor: context.colors.gray600,
                      hintKey: 'Clock-in Notes'.tr(),
                      controller: _notesController,
                      maxLines: 4,
                      onChanged: (value) {
                        cubit.updateNotes(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.white,
            ),
            child: SafeArea(
              child: CustomPrimaryButton.gradient(
                height: 52,
                textStyle: context.textTheme.labelLargeFont.copyWith(
                  color: context.colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                buttonText: state.isSubmitting
                    ? 'Submitting...'.tr()
                    : 'Clock In'.tr(),
                borderRadius: 100,
                onPressed: state.isSubmitting
                    ? null
                    : () {
                  cubit.submitClockIn();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
Widget _buildImageCard(
    BuildContext context,
    ClockInFlowCubit cubit,
    ClockInFlowState state
    ) {
  return Stack(
    children: [
      if (state.capturedImage != null)
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            File(state.capturedImage!.path),
            fit: BoxFit.cover,
            width: 334,
          ),
        ),

      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: _buildImageOverlay(
            context,
            cubit,
            state
        ),
      ),
    ],
  );
}
Widget _buildLocationAndRetake(
    BuildContext context,
    ClockInFlowCubit cubit,
    ClockInFlowState state
    ){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (state.userLocation != null) ...[
        Text(
          'Lat : ${state.userLocation!.latitude.toStringAsFixed(5)}',
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.white,
          ),
        ),
        Text(
          'Long : ${state.userLocation!.longitude.toStringAsFixed(5)}',
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.white,
          ),
        ),
      ],

      Text(
        formatDate(DateTime.now()),
        style: context.textTheme.labelMediumFont.copyWith(
          color: context.colors.white,
        ),
      ),

      const SizedBox(height: 16),

      CustomPrimaryButton.gradient(
        height: 52,
        textStyle: context.textTheme.labelLargeFont.copyWith(
          color: context.colors.white,
        ),
        buttonText: 'Retake Photo',
        borderRadius: 100,
        onPressed: state.isSubmitting
            ? null
            : () {
          cubit.retakePicture();
          context.pop();
        },
        icon: Icon(
          Iconsax.refresh_circle4,
          size: 20,
          color: context.colors.white,
        ),
      ),
    ],
  );

}

Widget _buildImageOverlay(
    BuildContext context,
    ClockInFlowCubit cubit,
    ClockInFlowState state
    ){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ExtensionColors.transparentColor,
          context.colors.black.withOpacity(0.5),
        ],
      ),
    ),
    padding: const EdgeInsets.all(16),
    child: _buildLocationAndRetake(
        context,
        cubit,
        state
    ),
  );
}

String formatDate(DateTime dateTime) {
  final datePart = DateFormat('dd/MM/yy hh:mma').format(dateTime);
  return '$datePart GMT +07:00';
}
