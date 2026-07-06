import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/util/image_picker_helper.dart';
import '../../logic/profile_cubit.dart';
import '../../logic/profile_state.dart';
import '../widget/popup/complete_profile_popup.dart';
import '../widget/popup/image_picker_options_popup.dart';
import '../widget/profile_content.dart';
import '../widget/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.purple400,
      appBar: CustomAppBar(
        title: 'my_profile'.tr(),
        showBackButton: true,
        backgroundColor: ExtensionColors.transparentColor,
        foregroundColor: context.colors.white,
        onBackPressed: () => context.pop(),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listenWhen: (previous, current) {
          return (current.isProfileNotCompleted &&
                  !previous.isProfileNotCompleted) ||
              (current.error != null &&
                  current.error != previous.error &&
                  !current.isProfileNotCompleted) ||
              (current.uploadImageError != null &&
                  current.uploadImageError != previous.uploadImageError) ||
              (previous.isUploadingImage &&
                  !current.isUploadingImage &&
                  current.uploadImageError == null &&
                  current.profile?.profileImage != previous.profile?.profileImage);
        },
        listener: (context, state) {
          if (state.isProfileNotCompleted) {
            CompleteProfilePopup.show(context);
          }

          if (state.error != null && !state.isProfileNotCompleted) {
            SnackBarHelper.showError(context, state.error!);
          }

          if (state.uploadImageError != null) {
            SnackBarHelper.showError(context, state.uploadImageError!);
            context.read<ProfileCubit>().clearUploadImageError();
          }

          if (!state.isUploadingImage &&
              state.uploadImageError == null &&
              state.profile?.profileImage != null) {
             SnackBarHelper.showSuccess(context, 'profile_image_updated'.tr());
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return _buildLoadingState(context);
          }

          if (state.profile == null) {
            return _buildErrorState(context, state);
          }

          if (state.isProfileNotCompleted) {
            return _buildErrorState(context, state);
          }


          final profile = state.profile!;

          return SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomPopup(
                iconWidget: _buildAvatarWidget(
                  context,
                  profile.profileImage,
                  state.isUploadingImage,
                ),
                iconWidgetHeight: 120,
                customHeader: ProfileHeaderWidget(profile: profile),
                content: ProfileContent(
                  profile: profile,
                  cubit: context.read<ProfileCubit>(),
                  //userIdentifier: state.userIdentifier,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAvatarWidget(
    BuildContext context,
    String? profileImage,
    bool isUploadingImage,
  ) {
    return GestureDetector(
      onTap: isUploadingImage
          ? null
          : () => _showImagePickerOptions(context),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: context.colors.purple500.withOpacity(0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: isUploadingImage
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : CachedNetworkImage(
                      imageUrl: profileImage ?? '',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppAssets.avatarPlaceholder,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),

          if (!isUploadingImage)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: context.colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: context.colors.purple500, width: 1),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: context.colors.purple500,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: Colors.white));
  }

  Widget _buildErrorState(BuildContext context, ProfileState state) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 64, color: context.colors.error),
            const SizedBox(height: 16),
            Text(
              state.error ?? 'failed_to_load_profile'.tr(),
              style: context.textTheme.bodyLargeFont,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<ProfileCubit>().getProfile(),
              child: Text('retry'.tr()),
            ),
          ],
        ),
      ),
    );
  }

  void _showImagePickerOptions(BuildContext context) {
    ImagePickerOptionsPopup.show(
      context,
      onGalleryTap: () => _pickImageFromGallery(context),
      onCameraTap: () => SnackBarHelper.showInfo(context, 'Camera image coming soon'),
    );
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final file = await ImagePickerHelper.pickImageFromGallery();

    if (file == null) {
      return;
    }

    if (!ImagePickerHelper.isFileSizeValid(file)){
      if (context.mounted) {
        SnackBarHelper.showError(
          context,
          'file_too_large'.tr(),
        );
      }
      return;
    }

    if (!ImagePickerHelper.isValidImageExtension(file)) {
      if (context.mounted) {
        SnackBarHelper.showError(
          context,
          'invalid_image_format'.tr(),
        );
      }
      return;
    }

    if (context.mounted) {
      context.read<ProfileCubit>().uploadProfileImage(file.path);
    }
  }
}
