import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class CameraControlButtons extends StatelessWidget {
  final VoidCallback? onCapture;
  final VoidCallback? onFlashToggle;
  final VoidCallback? onZoom;
  final bool isCapturing;
  final bool isFlashOn;

  const CameraControlButtons({
    super.key,
    required this.onCapture,
    this.onFlashToggle,
    this.onZoom,
    this.isCapturing = false,
    this.isFlashOn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            _CameraIconButton(
              textButton: "2x",
              onPressed: isCapturing ? null : onZoom,
              size: 28,
            ),
            _CaptureButton(
              onPressed: isCapturing ? null : onCapture,
              isCapturing: isCapturing,
            ),

            _CameraIconButton(
              icon: isFlashOn ? Iconsax.flash_1 : Iconsax.flash_slash,
              onPressed: isCapturing ? null : onFlashToggle,
              size: 28,
            ),

          ],
        ),
      ),
    );
  }
}

class _CaptureButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isCapturing;

  const _CaptureButton({
    required this.onPressed,
    required this.isCapturing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCapturing ? Colors.white.withOpacity(0.5) : Colors.white,
            ),
            child: isCapturing
                ? const Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 3,
                ),
              ),
            )
                : null,
          ),
        ),
      ),
    );
  }
}

class _CameraIconButton extends StatelessWidget {
  final String? textButton;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double size;

  const _CameraIconButton({
    this.textButton,
    this.icon,
    required this.onPressed,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ExtensionColors.backgroundCamera,
            border: Border.all(
              color:context.colors.white,
              width: 2,
            ),
          ),
          child: icon != null
              ? Icon(
            icon,
            color: context.colors.white,
            size: size,
          ) : Text(
              textButton!,
              style: context.textTheme.bodyMediumFont.copyWith(
                color: context.colors.white,
              ),
          )
      ),
    );
  }
}