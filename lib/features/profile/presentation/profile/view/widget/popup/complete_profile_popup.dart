import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../logic/profile_cubit.dart';
import '../../../logic/profile_state.dart';
import 'complete_profile_form_content.dart';

class CompleteProfilePopup extends StatelessWidget {
  const CompleteProfilePopup._();

  static Future<void> show(BuildContext context) {
    return PopupHelper.show(
      context: context,
      isDismissible: false,
      enableDrag: false,
      popup: BlocProvider.value(
        value: context.read<ProfileCubit>(),
        child: const CompleteProfilePopup._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) {
        return (current.profile != null &&
            !current.isProfileNotCompleted &&
            previous.isProfileNotCompleted) ||
            (current.error != null && current.error != previous.error);
      },
      listener: (context, state) {
        if (state.profile != null && !state.isProfileNotCompleted) {
          Navigator.of(context).pop();
          SnackBarHelper.showSuccess(
            context,
            'profile_completed_successfully'.tr(),
          );
          context.read<ProfileCubit>().refreshProfile();
        }

        if (state.error != null) {
          SnackBarHelper.showError(context, state.error!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();

        return CustomPopup(
          icon: Iconsax.user_edit,
          title: 'complete_your_profile'.tr(),
          description: 'fill_required_information'.tr(),
          content: const CompleteProfileFormContent(),
          primaryButtonText: 'complete_profile'.tr(),
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: !state.isLoading,
          primaryButtonOnPressed: cubit.submitCompleteProfile,
        );
      },
    );
  }
}