import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../logic/change_password_cubit.dart';
import '../../logic/change_password_state.dart';
import 'change_password_form_content.dart';

class ChangePasswordPopup extends StatelessWidget {
  const ChangePasswordPopup._();

  static Future<void> show(BuildContext context) {
    return PopupHelper.show(
      context: context,
      isDismissible: true,
      enableDrag: true,
      popup: BlocProvider(
        create: (_) => sl<ChangePasswordCubit>(),
        child: const ChangePasswordPopup._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (previous, current) {
        return (current.isSuccess && !previous.isSuccess) ||
            (current.error != null && current.error != previous.error);
      },
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.of(context).pop();
          SnackBarHelper.showSuccess(
            context,
            'password_changed_successfully'.tr(),
          );
        }

        if (state.error != null) {
          SnackBarHelper.showError(context, state.error!);
          context.read<ChangePasswordCubit>().clearError();
        }
      },
      builder: (context, state) {
        final cubit = context.read<ChangePasswordCubit>();

        return CustomPopup(
          icon: Iconsax.lock,
          title: 'change_password'.tr(),
          description: 'change_password_description'.tr(),
          content: const ChangePasswordFormContent(),
          primaryButtonText: 'change_password'.tr(),
          primaryButtonOnPressed: cubit.submit,
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: state.hasChanges && !state.isLoading,
          secondaryButtonText: 'cancel'.tr(),
          secondaryButtonOnPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}