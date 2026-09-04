import 'package:equatable/equatable.dart';
import '../../../../../../core/config/app_constant.dart';
import '../../../../domain/entity/auth_identifier.dart';
import '../../../../domain/entity/auth_type.dart';

class VerifyOtpState extends Equatable {
  final AuthIdentifier identifier;
  final String code;
  final bool isLoading;
  final bool isResending;
  final bool isVerified;
  final String? errorMessage;

  const VerifyOtpState({
    this.identifier = const AuthIdentifier(value: '', type: AuthType.email),
    this.code = '',
    this.isLoading = false,
    this.isVerified = false,
    this.isResending = false,
    this.errorMessage,
  });

  bool get isOtpComplete => code.length == AppConstant.otpLength;

  VerifyOtpState copyWith({
    AuthIdentifier? identifier,
    String? code,
    bool? isLoading,
    bool? isResending,
    bool? isVerified,
    String? errorMessage,
    bool clearError = false,
  }) {
    return VerifyOtpState(
      identifier: identifier ?? this.identifier,
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
      isResending: isResending ?? this.isResending,
      isVerified: isVerified ?? this.isVerified,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
    identifier,
    code,
    isLoading,
    isResending,
    isVerified,
    errorMessage,
  ];
}
