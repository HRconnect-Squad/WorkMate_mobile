import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../shared/model/country_filter.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';

Widget buildPhoneField(
    BuildContext context,
    SignUpState state,
    SignUpCubit cubit,
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'phone_number'.tr(),
        style: context.textTheme.bodySmallFont.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
      const SizedBox(height: 4),
      CustomInputField(
        initialValue: state.phone,
        onChanged: cubit.onPhoneChanged,
        enabled: !state.isLoading,
        keyboardType: TextInputType.phone,
        hintKey: 'phone_hint'.tr(),
        borderColor: state.phoneError != null
            ? context.colors.error
            : context.colors.gray400,
        filledColor: context.colors.white,
        labelHintStyle: context.colors.gray400,
        enabledColor: context.colors.gray400,
        radius: 8,
        contentPaddingHorizontal: 16,
        contentPaddingVertical: 16,
        prefixIcon: _buildCountryCodePicker(context, state, cubit),
      ),
      if (state.phoneError != null) ...[
        const SizedBox(height: 8),
        Text(
          state.phoneError!,
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.error,
          ),
        ),
      ],
    ],
  );
}

Widget _buildCountryCodePicker(
    BuildContext context,
    SignUpState state,
    SignUpCubit cubit,
    ) {
  return InkWell(
    onTap: state.isLoading
        ? null
        : () => _showCountryPicker(context, cubit),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '+${state.countryCode}',
            style: context.textTheme.titleSmallFont.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Iconsax.arrow_down_1,
            color: context.colors.purple500,
          ),
        ],
      ),
    ),
  );
}

void _showCountryPicker(BuildContext context, SignUpCubit cubit) {
  showCountryPicker(
    context: context,
    moveAlongWithKeyboard: true,
    showPhoneCode: true,
    countryFilter: CountryFilter.countryFilter,
    favorite: const ['PS', 'EG', 'SA'],
    countryListTheme: CountryListThemeData(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      textStyle: context.textTheme.titleSmallFont.copyWith(
        color: context.colors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      searchTextStyle: context.textTheme.titleSmallFont.copyWith(
        color: context.colors.textPrimary,
      ),
      inputDecoration: InputDecoration(
        labelText: 'search'.tr(),
        hintText: 'search_country'.tr(),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      bottomSheetHeight: MediaQuery.of(context).size.height * 0.6,
    ),
    onSelect: (Country country) {
      cubit.onCountryCodeChanged(country.phoneCode);
    },
  );
}