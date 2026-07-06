import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../profile/view/widget/popup/image_picker_options_popup.dart';
import '../../logic/personal_data_cubit.dart';
import '../../logic/personal_data_state.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: CustomAppBar.simple(
        title: 'personal_data'.tr(),
        showBackButton: true,
        leadingBackgroundColor: context.colors.purple100,
        onBackPressed: () => context.pop(),
      ),
      body: BlocConsumer<PersonalDataCubit, PersonalDataState>(
        listenWhen: (previous, current) {
          return (current.isSuccess && !previous.isSuccess) ||
              (current.error != null && current.error != previous.error);
        },
        listener: (context, state) {
          if (state.isSuccess) {
            SnackBarHelper.showSuccess(
              context,
              'profile_updated_successfully'.tr(),
            );
            context.pop(true);
          }

          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<PersonalDataCubit>().clearError();
          }
        },
        builder: (context, state) {
          if (state.isLoadingProfile) {
            return _buildLoadingState(context);
          }

          if (state.profile == null && !state.isLoadingProfile) {
            return _buildErrorState(context, state);
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPersonalDataSection(context, state),
                      const SizedBox(height: 16),
                      _buildPhoneSection(context, state),
                      const SizedBox(height: 16),
                      _buildAddressSection(context, state),
                    ],
                  ),
                ),
              ),
              _buildUpdateButton(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.colors.purple500,
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, PersonalDataState state) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: context.colors.error,
            ),
            const SizedBox(height: 16),
            Text(
              state.error ?? 'failed_to_load_profile'.tr(),
              style: context.textTheme.bodyLargeFont.copyWith(
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomPrimaryButton.filled(
              buttonText: 'retry'.tr(),
              onPressed: () => context.read<PersonalDataCubit>().loadProfile(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDataSection(BuildContext context,
      PersonalDataState state,) {
    final cubit = context.read<PersonalDataCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'my_personal_data'.tr(),
            style: context.textTheme.titleMediumFont.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'details_about_personal_data'.tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),

          _buildAvatarSection(context, state, cubit),
          const SizedBox(height: 16),

          _buildTextField(
            context,
            label: 'first_name'.tr(),
            value: state.firstName,
            error: state.firstNameError,
            icon: Iconsax.user,
            enabled: !state.isLoading,
            onChanged: cubit.onFirstNameChanged,
          ),
          const SizedBox(height: 16),

          _buildTextField(
            context,
            label: 'last_name'.tr(),
            value: state.lastName,
            error: state.lastNameError,
            icon: Iconsax.user,
            enabled: !state.isLoading,
            onChanged: cubit.onLastNameChanged,
          ),
          const SizedBox(height: 16),

          //(Read-only)
          _buildReadOnlyField(
            context,
            label: 'date_of_birth'.tr(),
            value: state.profile?.formattedDateOfBirth ?? '',
            icon: Iconsax.calendar,
          ),
          const SizedBox(height: 16),

          //(Read-only)
          _buildReadOnlyField(
            context,
            label: 'position'.tr(),
            value: state.profile?.jobTitle ?? state.profile?.formattedJobTitle ??
                '',
            icon: Iconsax.briefcase,
          ),
        ],
      ),
    );
  }

  void _showImagePickerOptions(BuildContext context) {
    ImagePickerOptionsPopup.show(
      context,
      onGalleryTap: () => context.read<PersonalDataCubit>().pickAvatarFromGallery(),
      onCameraTap: () => SnackBarHelper.showInfo(context, 'Camera image coming soon'),
    );
  }


  Widget _buildAvatarSection(BuildContext context,
      PersonalDataState state,
      PersonalDataCubit cubit,) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: state.isLoading ? null : () => _showImagePickerOptions(context),
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.colors.white,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: _buildAvatarImage(context, state),
                  ),
                ),

                if (!state.isLoading)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: context.colors.purple500, width: 1),
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: context.colors.purple500,
                        size: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'upload_photo'.tr(),
            style: context.textTheme.titleSmallFont.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'photo_format_hint'.tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarImage(BuildContext context, PersonalDataState state) {
    if (state.selectedAvatarPath != null) {
      return Image.file(
        File(state.selectedAvatarPath!),
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      );
    }
    if (state.profile?.profileImage != null &&
        state.profile!.profileImage!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: state.profile!.profileImage!,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
        placeholder: (context, url) =>
        const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) =>
            Image.asset(
              AppAssets.avatarPlaceholder,
              fit: BoxFit.cover,
            ),
      );
    }

    return Image.asset(
      AppAssets.avatarPlaceholder,
      fit: BoxFit.cover,
      width: 100,
      height: 100,
    );
  }

  Widget _buildAddressSection(BuildContext context,
      PersonalDataState state,) {
    final cubit = context.read<PersonalDataCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'address'.tr(),
            style: context.textTheme.titleMediumFont.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'your_current_domicile'.tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.textSecondary,
            ),
          ),

          const SizedBox(height: 16),


          _buildTextField(
            context,
            label: 'full_address'.tr(),
            value: state.address,
            error: state.addressError,
            icon: Iconsax.location,
            enabled: !state.isLoading,
            onChanged: cubit.onAddressChanged,
            minLines: 3,
            maxLines: 5,
            hint: 'enter_full_address'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneSection(BuildContext context, PersonalDataState state) {
    final cubit = context.read<PersonalDataCubit>();
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                context,
                label: 'phone'.tr(),
                value: state.phone,
                error: state.phoneError,
                icon: Iconsax.call,
                enabled: !state.isLoading,
                keyboardType: TextInputType.phone,
                onChanged: cubit.onPhoneChanged,
                hint: 'enter_phone_optional'.tr(),
              ),
            ]
        )
    );
  }

  Widget _buildTextField(BuildContext context, {
    required String label,
    required String value,
    required String? error,
    required IconData icon,
    required bool enabled,
    required ValueChanged<String> onChanged,
    String? hint,
    TextInputType? keyboardType,
    int minLines = 1,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 8),
        CustomInputField(
          initialValue: value,
          hintKey: hint ?? label,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines,
          enabled: enabled,
          onChanged: onChanged,
          radius: 12,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 14,
          filledColor: context.colors.white,
          enabledColor: context.colors.gray300,
          borderColor: error != null ? context.colors.error : context.colors
              .gray300,
          prefixIcon: minLines > 1
              ? Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Icon(icon, color: context.colors.purple400, size: 20),
          )
              : Icon(icon, color: context.colors.purple400, size: 20),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(
            error,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildReadOnlyField(BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: context.colors.gray50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.colors.gray200),
          ),
          child: Row(
            children: [
              Icon(icon, color: context.colors.gray400, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value.isNotEmpty ? value : '-',
                  style: context.textTheme.bodyMediumFont.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ),
              Icon(
                Iconsax.arrow_down_1,
                color: context.colors.gray400,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateButton(BuildContext context, PersonalDataState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.white,
        boxShadow: [
          BoxShadow(
            color: context.colors.gray200,
            blurRadius: 8,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: CustomPrimaryButton.gradient(
          buttonText: 'update'.tr(),
          isLoading: state.isLoading,
          isEnabled: state.hasChanges && !state.isLoading,
          onPressed: () => context.read<PersonalDataCubit>().submit(),
        ),
      ),
    );
  }

}