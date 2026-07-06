import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:workmate/core/presentation/design_system/components/custom_primary_button.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class ImagePickerOptionsPopup extends StatelessWidget {
  final VoidCallback onGalleryTap;
  final VoidCallback? onCameraTap;

  const ImagePickerOptionsPopup._({
    required this.onGalleryTap,
    this.onCameraTap,
  });

  static Future<void> show(
      BuildContext context, {
        required VoidCallback onGalleryTap,
        VoidCallback? onCameraTap,
      }) {
    return PopupHelper.show(
      context: context,
      popup: ImagePickerOptionsPopup._(
        onGalleryTap: onGalleryTap,
        onCameraTap: onCameraTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: context.colors.gray300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          Text(
            'select_image_source'.tr(),
            style: context.textTheme.popupTitleFont.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),

          _buildOption(
            context,
            icon: Iconsax.gallery,
            title: 'choose_from_gallery'.tr(),
            subtitle: 'select_image_from_device'.tr(),
            onTap: () {
              Navigator.of(context).pop();
              onGalleryTap();
            },
          ),

          if (onCameraTap != null) ...[
            const SizedBox(height: 12),
            _buildOption(
              context,
              icon: Iconsax.camera,
              title: 'take_photo'.tr(),
              subtitle: 'capture_with_camera'.tr(),
              onTap: () {
                Navigator.of(context).pop();
                onCameraTap!();
              },
            ),
          ],

          const SizedBox(height: 16),

          CustomPrimaryButton.text(
            onPressed: () => Navigator.of(context).pop(),
            buttonText: 'cancel'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.gray50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.colors.gray200),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: context.colors.purple100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: context.colors.purple500,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleSmallFont.copyWith(
                      color: context.colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: context.textTheme.bodySmallFont.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: context.colors.gray400,
            ),
          ],
        ),
      ),
    );
  }
}