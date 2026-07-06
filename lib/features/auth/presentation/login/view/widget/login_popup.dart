import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/check_box.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../../../domain/entity/auth_type.dart';
import '../../../shared/model/country_filter.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';
import '../../../forget_password/view/screen/popup/forgot_password_popup.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  AuthType _loginType = AuthType.email;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return (current.isSuccess && !previous.isSuccess) ||
            (current.apiError != null && current.apiError != previous.apiError);
      },
      listener: (context, state) {
        if (state.isSuccess) {
          SnackBarHelper.showSuccess(context, 'Logged in successfully!');
          context.go(RouteNames.homeScreen);
        }

        if (state.apiError != null) {
          SnackBarHelper.showError(context, state.apiError!);
        }
      },

      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(32, 40, 32, 32),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'sign_in'.tr(),
                  style: context.textTheme.headLineSmallFont.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'sign_to_account'.tr(),
                  style: context.textTheme.titleSmallFont.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _loginType == AuthType.email
                      ? _buildEmailField(context, cubit, state)
                      : _buildPhoneField(context, cubit, state),
                ),
                const SizedBox(height: 16),

                _buildPasswordField(context, cubit, state),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: CustomCheckbox(
                        isChecked: state.rememberMe,
                        label: 'remember_me'.tr(),
                        onChanged: (value) {
                          cubit.onRememberMeChanged(value);
                        },
                      ),
                    ),
                    CustomPrimaryButton.text(
                      onPressed: () {
                        ForgotPasswordPopup.show(context);
                      },
                      padding: EdgeInsets.zero,
                      buttonText: 'forgot_password'.tr(),
                      textStyle: context.textTheme.bodySmallFont.copyWith(
                        color: context.colors.purple600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                CustomPrimaryButton.gradient(
                  buttonText: 'sign_in'.tr(),
                  textStyle: context.textTheme.labelLargeFont.copyWith(
                    color: context.colors.pureWhite,
                  ),
                  isLoading: state.isLoading,
                  isEnabled: state.isFormValid && !state.isLoading,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    cubit.submit(_loginType);
                  },
                ),
                const SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: context.colors.gray200,
                        thickness: 1,
                        height: 10,
                        endIndent: 16,
                      ),
                    ),
                    Text(
                      'or'.tr(),
                      style: context.textTheme.labelMediumFont.copyWith(
                        color: context.colors.gray400,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 16,
                        color: context.colors.gray200,
                        thickness: 1,
                        height: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                CustomPrimaryButton.outlined(
                  borderColor: context.colors.purple500,
                  buttonText: _loginType == AuthType.email
                      ? 'sign_with_phone'.tr()
                      : 'sign_with_email'.tr(),
                  icon: Icon(
                    _loginType == AuthType.email ? Iconsax.call5 : Iconsax.sms,
                    color: context.colors.purple500,
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    cubit.onIdentifierChanged('');
                    setState(() {
                      _loginType = _loginType == AuthType.email
                          ? AuthType.phone
                          : AuthType.email;
                    });
                  },
                ),
                const SizedBox(height: 24),

                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'dont_have_account'.tr(),
                        style: context.textTheme.labelSmallFont.copyWith(
                          color: context.colors.textPrimary,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: GestureDetector(
                          onTap: () {
                            context.go(RouteNames.register);
                          },
                          child: Text(
                            'sign_up_here'.tr(),
                            style: context.textTheme.labelSmallFont.copyWith(
                              color: context.colors.purple600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmailField(
      BuildContext context,
      LoginCubit cubit,
      LoginState state,
      ) {
    return Column(
      key: const ValueKey('email'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'email'.tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          initialValue: state.identifier,
          onChanged: cubit.onIdentifierChanged,
          enabled: !state.isLoading,
          keyboardType: TextInputType.emailAddress,
          hintKey: 'my_email'.tr(),
          borderColor: state.identifierError != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray400,
          radius: 8,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
          prefixIcon: Icon(
            Iconsax.sms,
            color: context.colors.purple500,
          ),
        ),
        if (state.identifierError != null) ...[
          const SizedBox(height: 8),
          Text(
            state.identifierError!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPhoneField(
      BuildContext context,
      LoginCubit cubit,
      LoginState state,
      ) {
    return Column(
      key: const ValueKey('phone'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'phone_number'.tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w400,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          initialValue: state.identifier,
          onChanged: cubit.onIdentifierChanged,
          enabled: !state.isLoading,
          keyboardType: TextInputType.phone,
          hintKey: '01*********',
          borderColor: state.identifierError != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray400,
          radius: 8,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
          prefixIcon: InkWell(
            onTap: state.isLoading
                ? null
                : () => _showCountryPicker(context, cubit, state),
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
          ),
        ),
        if (state.identifierError != null) ...[
          const SizedBox(height: 8),
          Text(
            state.identifierError!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPasswordField(
      BuildContext context,
      LoginCubit cubit,
      LoginState state,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'password'.tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 4),
        CustomInputField(
          initialValue: state.password,
          onChanged: cubit.onPasswordChanged,
          enabled: !state.isLoading,
          keyboardType: TextInputType.visiblePassword,
          isObscureText: _obscurePassword,
          hintKey: 'my_password'.tr(),
          borderColor: state.passwordError != null
              ? context.colors.error
              : context.colors.gray400,
          filledColor: context.colors.white,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray400,
          radius: 8,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
          prefixIcon: Icon(
            Iconsax.lock,
            color: context.colors.purple500,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() => _obscurePassword = !_obscurePassword);
            },
            icon: Icon(
              _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
              color: context.colors.purple500,
            ),
          ),
        ),
        if (state.passwordError != null) ...[
          const SizedBox(height: 8),
          Text(
            state.passwordError!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }

  void _showCountryPicker(
      BuildContext context,
      LoginCubit cubit,
      LoginState state,) {
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
}