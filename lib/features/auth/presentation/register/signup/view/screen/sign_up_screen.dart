import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../../core/presentation/design_system/theme/color/app_constant_colors.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../../core/presentation/routes/route_names.dart';
import '../../../verify_otp_popup/view/verify_otp_popup.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';
import '../../view/widgets/build_email.dart';
import '../../view/widgets/build_password.dart';
import '../widgets/build_phone_number.dart';
import '../widgets/build_terms_and_conditions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) {
          return (current.isRegistered && !previous.isRegistered) ||
              (current.apiError != null &&
                  current.apiError != previous.apiError);
        },
        listener: (context, state) {
          if (state.isRegistered) {
            VerifyOtpPopUp.show(context, email: state.email);
          }

          if (state.apiError != null) {
            SnackBarHelper.showError(context, state.apiError!);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(32, 44, 32, 0),
                    child: Column(
                      children: [
                        _buildLogo(),
                        const SizedBox(height: 12),
                        _buildHeader(context),
                        const SizedBox(height: 24),
                        _buildForm(context, state),
                        const SizedBox(height: 12),
                        buildTermsAndConditions(context, state),
                        const SizedBox(height: 36),
                        _buildSignUpButton(context, state),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                _buildSignInLink(context),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppConstantColors.purple500,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppConstantColors.purple500.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        Iconsax.finger_scan5,
        color: AppConstantColors.white,
        size: 40,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          'app_name'.tr(),
          style: context.textTheme.headLineSmallFont.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colors.textPrimary,
          ),
        ),
        Text(
          'register_subtitle'.tr(),
          style: context.textTheme.titleSmallFont.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context, SignUpState state) {
    final cubit = context.read<SignUpCubit>();

    return Column(
      children: [
        buildEmailField(context, state, cubit),
        const SizedBox(height: 16),

        buildPhoneField(context, state, cubit),
        const SizedBox(height: 16),

        buildPasswordField(context, state, cubit),
        const SizedBox(height: 16),

        buildConfirmPasswordField(context, state, cubit),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context, SignUpState state) {
    final cubit = context.read<SignUpCubit>();

    return CustomPrimaryButton.gradient(
      height: 48,
      textStyle: context.textTheme.labelLargeFont.copyWith(
        color: context.colors.white,
      ),
      buttonText: 'register'.tr(),
      borderRadius: 100,
      isLoading: state.isLoading,
      isEnabled: state.isFormValid && !state.isLoading,
      onPressed: cubit.submit,
    );
  }

  Widget _buildSignInLink(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'already_have_account'.tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          const TextSpan(text: ' '),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: () => context.go(RouteNames.login),
              child: Text(
                'sign_in_here'.tr(),
                style: context.textTheme.labelMediumFont.copyWith(
                  color: AppConstantColors.purple500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
