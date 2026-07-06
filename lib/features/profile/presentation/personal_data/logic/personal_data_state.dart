import 'package:equatable/equatable.dart';

import '../../../domain/entity/employee_profile.dart';

class PersonalDataState extends Equatable {
  final EmployeeProfile? profile;

  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String? selectedAvatarPath;

  final String? firstNameError;
  final String? lastNameError;
  final String? phoneError;
  final String? addressError;

  final bool isLoading;
  final bool isLoadingProfile;
  final bool isSuccess;
  final String? error;
  final bool isUploadingAvatar;

  const PersonalDataState({
    this.profile,
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
    this.address = '',
    this.selectedAvatarPath,
    this.firstNameError,
    this.lastNameError,
    this.phoneError,
    this.addressError,
    this.isLoading = false,
    this.isLoadingProfile = false,
    this.isSuccess = false,
    this.error,
    this.isUploadingAvatar = false,
  });

  bool get hasChanges {
    if (profile == null) return false;
    return firstName != (profile!.firstName) ||
        lastName != (profile!.lastName) ||
        phone != (profile!.phone ?? '') ||
        address != (profile!.address) ||
        selectedAvatarPath != null;
  }

  String? get currentAvatarUrl => selectedAvatarPath ?? profile?.profileImage;

  bool get isFormValid =>
      firstName.trim().isNotEmpty &&
          lastName.trim().isNotEmpty &&
          address.trim().isNotEmpty;

  PersonalDataState copyWith({
    EmployeeProfile? profile,
    String? firstName,
    String? lastName,
    String? phone,
    String? address,
    String? selectedAvatarPath,
    String? firstNameError,
    String? lastNameError,
    String? phoneError,
    String? addressError,
    bool? isLoading,
    bool? isLoadingProfile,
    bool? isSuccess,
    String? error,
    bool? isUploadingAvatar,
    bool clearFirstNameError = false,
    bool clearLastNameError = false,
    bool clearPhoneError = false,
    bool clearAddressError = false,
    bool clearError = false,
    bool clearSelectedAvatar = false,
    bool clearAllErrors = false,
  }) {
    return PersonalDataState(
      profile: profile ?? this.profile,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      selectedAvatarPath: clearSelectedAvatar
          ? null
          : (selectedAvatarPath ?? this.selectedAvatarPath),
      firstNameError: (clearFirstNameError || clearAllErrors)
          ? null
          : (firstNameError ?? this.firstNameError),
      lastNameError: (clearLastNameError || clearAllErrors)
          ? null
          : (lastNameError ?? this.lastNameError),
      phoneError: (clearPhoneError || clearAllErrors)
          ? null
          : (phoneError ?? this.phoneError),
      addressError: (clearAddressError || clearAllErrors)
          ? null
          : (addressError ?? this.addressError),
      isLoading: isLoading ?? this.isLoading,
      isLoadingProfile: isLoadingProfile ?? this.isLoadingProfile,
      isSuccess: isSuccess ?? this.isSuccess,
      error: clearError ? null : (error ?? this.error),
      isUploadingAvatar: isUploadingAvatar ?? this.isUploadingAvatar,
    );
  }

  @override
  List<Object?> get props => [
    profile,
    firstName,
    lastName,
    phone,
    address,
    selectedAvatarPath,
    firstNameError,
    lastNameError,
    phoneError,
    addressError,
    isLoading,
    isLoadingProfile,
    isSuccess,
    error,
    isUploadingAvatar,
  ];
}