import 'package:easy_localization/easy_localization.dart';
import 'package:workmate/features/profile/presentation/personal_data/logic/personal_data_state.dart';
import '../../../../../core/config/app_constant.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../core/presentation/util/image_picker_helper.dart';
import '../../../../../core/presentation/util/validator.dart';
import '../../../domain/usecase/get_profile_usecase.dart';
import '../../../domain/usecase/update_profile_usecase.dart';

class PersonalDataCubit extends BaseCubit<PersonalDataState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  PersonalDataCubit({
    required GetProfileUseCase getProfileUseCase,
    required UpdateProfileUseCase updateProfileUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        _updateProfileUseCase = updateProfileUseCase,
        super(const PersonalDataState());

  Future<void> loadProfile() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoadingProfile: true,
        clearError: true,
      )),
      call: () => _getProfileUseCase(),
      onSuccess: (profile) {
        updateState((s) => s.copyWith(
          isLoadingProfile: false,
          profile: profile,
          firstName: profile.firstName,
          lastName: profile.lastName,
          phone: profile.phone ?? '',
          address: profile.address,
          clearAllErrors: true,
        ));
      },
      onError: (error) {
        updateState((s) => s.copyWith(
          isLoadingProfile: false,
          error: error.message,
        ));
      },
    );
  }

  void onFirstNameChanged(String value) {
    updateState((s) => s.copyWith(
      firstName: value,
      clearFirstNameError: true,
      clearError: true,
    ));
  }

  void onLastNameChanged(String value) {
    updateState((s) => s.copyWith(
      lastName: value,
      clearLastNameError: true,
      clearError: true,
    ));
  }

  void onPhoneChanged(String value) {
    updateState((s) => s.copyWith(
      phone: value,
      clearPhoneError: true,
      clearError: true,
    ));
  }

  void onAddressChanged(String value) {
    updateState((s) => s.copyWith(
      address: value,
      clearAddressError: true,
      clearError: true,
    ));
  }

  Future<void> pickAvatarFromGallery() async {
    final file = await ImagePickerHelper.pickImageFromGallery();

    if (file == null) return;

    if (!ImagePickerHelper.isFileSizeValid(file)) {
      updateState((s) => s.copyWith(
        error: 'file_too_large'.tr( args: [AppConstant.maxImageSizeMB.toString()]),
      ));
      return;
    }

    if (!ImagePickerHelper.isValidImageExtension(file)) {
      updateState((s) => s.copyWith(
        error: 'invalid_image_format'.tr(),
      ));
      return;
    }

    updateState((s) => s.copyWith(
      selectedAvatarPath: file.path,
      clearError: true,
    ));
  }

  Future<void> submit() async {
    if (!_validate()) return;

    if (!state.hasChanges) {
      updateState((s) => s.copyWith(error: 'no_changes_to_save'.tr()));
      return;
    }

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearError: true,
        isSuccess: false,
      )),
      call: () => _updateProfileUseCase(
        firstName: state.firstName.trim(),
        lastName: state.lastName.trim(),
        phone: state.phone.trim().isNotEmpty ? state.phone.trim() : null,
        address: state.address.trim(),
        avatarPath: state.selectedAvatarPath,
      ),
      onSuccess: (profile) {
        updateState((s) => s.copyWith(
          isLoading: false,
          isSuccess: true,
          profile: profile,
          firstName: profile.firstName,
          lastName: profile.lastName,
          phone: profile.phone ?? '',
          address: profile.address,
          clearSelectedAvatar: true,
        ));
      },
      onError: (error) {
        updateState((s) => s.copyWith(
          isLoading: false,
          isSuccess: false,
          error: error.message,
        ));
      },
    );
  }

  bool _validate() {
    bool isValid = true;

    if (state.firstName.trim().isEmpty) {
      updateState((s) => s.copyWith(firstNameError: 'first_name_required'.tr()));
      isValid = false;
    }

    if (state.lastName.trim().isEmpty) {
      updateState((s) => s.copyWith(lastNameError: 'last_name_required'.tr()));
      isValid = false;
    }

    if (state.address.trim().isNotEmpty) {
      if (state.address
          .trim()
          .isEmpty || state.address
          .trim()
          .length < 5 || state.address
          .trim()
          .length > 60) {
        updateState((s) => s.copyWith(addressError: 'address_not_valid'.tr()));
        isValid = false;
      }
    }

    if (state.phone.trim().isNotEmpty) {
      final identifierError = Validators.validatePhone(
        state.phone.trim(),
      );

      if (identifierError != null) {
        updateState((s) => s.copyWith(phoneError: identifierError));
        isValid = false;
      }
    }

    return isValid;
  }

  void clearSelectedAvatar() {
    updateState((s) => s.copyWith(clearSelectedAvatar: true));
  }

  void clearError() {
    updateState((s) => s.copyWith(clearError: true));
  }

  void resetForm() {
    if (state.profile != null) {
      updateState((s) => s.copyWith(
        firstName: state.profile!.firstName,
        lastName: state.profile!.lastName,
        phone: state.profile!.phone ?? '',
        address: state.profile!.address,
        clearSelectedAvatar: true,
        clearAllErrors: true,
      ));
    }
  }
}