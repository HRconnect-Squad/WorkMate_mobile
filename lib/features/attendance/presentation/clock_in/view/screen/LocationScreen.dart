import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/ClockInFlowCubit.dart';
import '../../logic/ClockInFlowStatus.dart';
import '../widget/ClockInMap.dart';
import '../widget/ClockInPopup.dart';

class ClockInLocationScreen extends StatelessWidget {
  const ClockInLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClockInFlowCubit, ClockInFlowState>(
      listenWhen: (previous, current) =>
      current.hasError && ModalRoute.of(context)?.isCurrent == true,
      listener: (context, state) {
        if (state.hasError && state.errorMessage != null) {
          SnackBarHelper.showError(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ClockInFlowCubit>();

        if (state.isLocationLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.hasError) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Clock In Area',
              backgroundColor: ExtensionColors.transparentColor,
              showBackButton: true,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_off_outlined, size: 56),
                    const SizedBox(height: 16),
                    Text(
                      state.errorMessage ?? 'Something went wrong'.tr(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    CustomPrimaryButton.gradient(
                      buttonText: 'Retry'.tr(),
                      onPressed: () => cubit.retryLoadLocation(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (!state.isLocationReady) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: 'Clock In Area',
            backgroundColor: ExtensionColors.transparentColor,
            showBackButton: true,
          ),
          body: Stack(
            children: [
              ClockInMap(
                clockInFlowState: state,
                onMarkerTap: () {
                  cubit.togglePopup();
                },
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    if (state.isPopupVisible)
                      ClockInPopup(
                        userName: state.userName ?? "---",
                        userImageUrl: state.userImageUrl ?? "",
                        dateJoined: DateFormat(
                          'd MMMM y',
                          context.locale.languageCode,
                        ).format(DateTime.now()),
                        locationText: state.locationCoordinates,
                        clockInTime: "09:00".tr(),
                        clockOutTime: "05:00".tr(),
                      ),

                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: CustomPrimaryButton.gradient(
                        buttonText: 'Selfie To Clock In',
                        onPressed: () {
                          cubit.initializeCamera();
                          context.push(RouteNames.selfieCamera);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
