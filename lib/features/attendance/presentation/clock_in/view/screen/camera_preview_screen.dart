import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/ClockInFlowCubit.dart';
import '../../logic/ClockInFlowStatus.dart';
import '../widget/CameraControlButtons.dart';

class CameraPreviewScreen extends StatelessWidget {
  const CameraPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClockInFlowCubit, ClockInFlowState>(
      listenWhen: (previous, current) =>
      (current.hasError ||
          (current.status == ClockInFlowStatus.photoCaptured && current.hasImage)) &&
          ModalRoute.of(context)?.isCurrent == true,
      listener: (context, state) {
        if (state.status == ClockInFlowStatus.photoCaptured &&
            state.hasImage) {
          context.push(RouteNames.confirmationScreen);
        }

        if (state.hasError && state.errorMessage != null) {
          SnackBarHelper.showError(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ClockInFlowCubit>();

        if (state.status == ClockInFlowStatus.loadingCamera) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.hasError && state.cameraController == null) {
          return Scaffold(
            appBar: CustomAppBar(
              title: "Camera",
              backgroundColor: ExtensionColors.backgroundCamera,
              actions: [
                IconButton(
                  icon: const Icon(Iconsax.close_circle, size: 28),
                  onPressed: () => context.pop(),
                ),
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.camera_slash, size: 56),
                    const SizedBox(height: 16),
                    Text(
                      state.errorMessage ?? 'Camera unavailable',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => cubit.retryInitializeCamera(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: CustomAppBar(
            title: "Camera",
            backgroundColor: ExtensionColors.backgroundCamera,
            leading: IconButton(
              icon: Icon(
                state.isFlashOn ? Iconsax.flash_1 : Iconsax.flash_slash,
                size: 28,
              ),
              onPressed: () => cubit.toggleFlash(),
            ),

            actions: [
              IconButton(
                icon: const Icon(Iconsax.close_circle, size: 28),
                onPressed: () => context.pop(),
              ),
            ],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              if (state.cameraController != null &&
                  state.cameraController!.value.isInitialized)
                CameraPreview(state.cameraController!),

              CameraControlButtons(
                onCapture: () => cubit.takePicture(),
                onFlashToggle: () => cubit.toggleFlash(),
                onZoom: () => cubit.adjustZoom(),
                isCapturing: state.isCapturing,
                isFlashOn: state.isFlashOn,
              ),
            ],
          ),
        );
      },
    );
  }
}
