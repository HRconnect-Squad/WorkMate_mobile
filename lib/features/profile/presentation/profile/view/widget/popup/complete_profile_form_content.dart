import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../../core/presentation/design_system/theme/workmate_theme.dart';
import '../../../../../domain/entity/gender.dart';
import '../../../../helper/extention.dart';
import '../../../logic/profile_cubit.dart';
import '../../../logic/profile_state.dart';

class CompleteProfileFormContent extends StatelessWidget {
  const CompleteProfileFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    context,
                    label: '${'first_name'.tr()} *',
                    hint: 'first_name'.tr(),
                    value: state.firstName,
                    error: state.firstNameError,
                    icon: Iconsax.user,
                    enabled: !state.isLoading,
                    onChanged: cubit.onFirstNameChanged,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    context,
                    label: '${'last_name'.tr()} *',
                    hint: 'last_name'.tr(),
                    value: state.lastName,
                    error: state.lastNameError,
                    icon: Iconsax.user,
                    enabled: !state.isLoading,
                    onChanged: cubit.onLastNameChanged,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            _buildTextField(
              context,
              label: 'phone'.tr(),
              hint: 'enter_phone_optional'.tr(),
              value: state.phone ?? '',
              error: state.phoneError,
              icon: Iconsax.call,
              keyboardType: TextInputType.phone,
              enabled: !state.isLoading,
              onChanged: cubit.onPhoneChanged,
            ),
            const SizedBox(height: 16),

            _buildDatePicker(context, state, cubit),
            const SizedBox(height: 16),

            _buildGenderSelector(context, state, cubit),
            const SizedBox(height: 16),

            _buildTextField(
              context,
              label: 'address'.tr(),
              hint: 'enter_address_optional'.tr(),
              value: state.address ?? '',
              error: state.addressError,
              icon: Iconsax.location,
              minLines: 2,
              maxLines: 3,
              enabled: !state.isLoading,
              onChanged: cubit.onAddressChanged,
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(
      BuildContext context, {
        required String label,
        required String hint,
        required String value,
        required String? error,
        required IconData icon,
        required bool enabled,
        required ValueChanged<String> onChanged,
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
        const SizedBox(height: 4),
        CustomInputField(
          initialValue: value,
          hintKey: hint,
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
          borderColor: error != null ? context.colors.error : context.colors.gray300,
          prefixIcon: minLines > 1
              ? Padding(
            padding: const EdgeInsets.only(bottom: 24),
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

  Widget _buildDatePicker(
      BuildContext context,
      ProfileState state,
      ProfileCubit cubit,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'date_of_birth'.tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: state.isLoading
              ? null
              : () => _selectDateOfBirth(context, cubit),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: context.colors.white,
              border: Border.all(
                color: state.dateOfBirthError != null
                    ? context.colors.error
                    : context.colors.gray300,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Iconsax.calendar,
                  size: 20,
                  color: context.colors.purple400,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    state.dateOfBirth != null
                        ? DateFormat('yyyy-MM-dd').format(state.dateOfBirth!)
                        : 'select_date'.tr(),
                    style: context.textTheme.bodyMediumFont.copyWith(
                      color: state.dateOfBirth != null
                          ? context.colors.textPrimary
                          : context.colors.gray400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (state.dateOfBirthError != null) ...[
          const SizedBox(height: 4),
          Text(
            state.dateOfBirthError!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildGenderSelector(
      BuildContext context,
      ProfileState state,
      ProfileCubit cubit,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'gender'.tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildGenderOption(
                context,
                gender: Gender.unspecified,
                isSelected: state.selectedGender == Gender.unspecified,
                enabled: !state.isLoading,
                onTap: () => cubit.onGenderChanged(Gender.unspecified),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildGenderOption(
                context,
                gender: Gender.male,
                isSelected: state.selectedGender == Gender.male,
                enabled: !state.isLoading,
                onTap: () => cubit.onGenderChanged(Gender.male),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildGenderOption(
                context,
                gender: Gender.female,
                isSelected: state.selectedGender == Gender.female,
                enabled: !state.isLoading,
                onTap: () => cubit.onGenderChanged(Gender.female),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption(
      BuildContext context, {
        required Gender gender,
        required bool isSelected,
        required bool enabled,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.purple100 : context.colors.white,
          border: Border.all(
            color: isSelected ? context.colors.purple500 : context.colors.gray300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            gender.toDisplayString(),
            style: context.textTheme.bodyMediumFont.copyWith(
              color: isSelected
                  ? context.colors.purple500
                  : context.colors.textPrimary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateOfBirth(
      BuildContext context,
      ProfileCubit cubit,
      ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: WorkMateTheme.light(),
          child: child!,
        );
      },
    );
    if (picked != null) {
      cubit.onDateOfBirthChanged(picked);
    }
  }
}