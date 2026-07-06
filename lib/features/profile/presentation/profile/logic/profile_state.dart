import 'package:equatable/equatable.dart';
import '../../../domain/entity/employee_profile.dart';
import '../../../domain/entity/gender.dart';

class ProfileState extends Equatable {
  final EmployeeProfile? profile;
  final String? userIdentifier;
  final bool isLoading;
  final bool isProfileNotCompleted;
  final String? error;

  final bool isUploadingImage;
  final String? uploadImageError;

  final String firstName;
  final String lastName;
  final String? phone;
  final DateTime? dateOfBirth;
  final Gender selectedGender;
  final String? address;
  final String? selectedProfileImagePath;

  final String? firstNameError;
  final String? lastNameError;
  final String? phoneError;
  final String? dateOfBirthError;
  final String? addressError;

  const ProfileState({
    this.profile,
    this.userIdentifier,
    this.isLoading = false,
    this.isProfileNotCompleted = false,
    this.error,
    this.isUploadingImage = false,
    this.uploadImageError,
    this.firstName = '',
    this.lastName = '',
    this.phone,
    this.dateOfBirth,
    this.selectedGender = Gender.male,
    this.address,
    this.selectedProfileImagePath,
    this.firstNameError,
    this.lastNameError,
    this.phoneError,
    this.dateOfBirthError,
    this.addressError,
  });

  bool get isFormValid =>
      firstName.trim().isNotEmpty && lastName.trim().isNotEmpty;

  ProfileState copyWith({
    EmployeeProfile? profile,
    String? userIdentifier,
    bool? isLoading,
    bool? isProfileNotCompleted,
    String? error,
    bool? isUploadingImage,
    String? uploadImageError,
    String? firstName,
    String? lastName,
    String? phone,
    DateTime? dateOfBirth,
    Gender? selectedGender,
    String? address,
    String? selectedProfileImagePath,
    String? firstNameError,
    String? lastNameError,
    String? phoneError,
    String? dateOfBirthError,
    String? addressError,
    bool clearError = false,
    bool clearUploadImageError = false,
    bool clearFirstNameError = false,
    bool clearLastNameError = false,
    bool clearPhoneError = false,
    bool clearDateOfBirthError = false,
    bool clearAddressError = false,
    bool clearAllFormErrors = false,
    bool clearSelectedProfileImage = false,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      userIdentifier: userIdentifier ?? this.userIdentifier,
      isLoading: isLoading ?? this.isLoading,
      isProfileNotCompleted: isProfileNotCompleted ?? this.isProfileNotCompleted,
      error: clearError ? null : (error ?? this.error),
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      uploadImageError: clearUploadImageError ? null : (uploadImageError ?? this.uploadImageError),
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      selectedGender: selectedGender ?? this.selectedGender,
      address: address ?? this.address,
      selectedProfileImagePath: clearSelectedProfileImage
          ? null
          : (selectedProfileImagePath ?? this.selectedProfileImagePath),
      firstNameError: (clearFirstNameError || clearAllFormErrors)
          ? null
          : (firstNameError ?? this.firstNameError),
      lastNameError: (clearLastNameError || clearAllFormErrors)
          ? null
          : (lastNameError ?? this.lastNameError),
      phoneError: (clearPhoneError || clearAllFormErrors)
          ? null
          : (phoneError ?? this.phoneError),
      dateOfBirthError: (clearDateOfBirthError || clearAllFormErrors)
          ? null
          : (dateOfBirthError ?? this.dateOfBirthError),
      addressError: (clearAddressError || clearAllFormErrors)
          ? null
          : (addressError ?? this.addressError),
    );
  }

  @override
  List<Object?> get props => [
    profile,
    userIdentifier,
    isLoading,
    isProfileNotCompleted,
    error,
    isUploadingImage,
    uploadImageError,
    firstName,
    lastName,
    phone,
    dateOfBirth,
    selectedGender,
    address,
    selectedProfileImagePath,
    firstNameError,
    lastNameError,
    phoneError,
    dateOfBirthError,
    addressError,
  ];
}