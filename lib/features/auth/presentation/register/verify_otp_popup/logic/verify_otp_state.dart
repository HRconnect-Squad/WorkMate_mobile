import 'package:equatable/equatable.dart';

class VerifyOtpState extends Equatable {
  final String identifier;
  final String code;
  final bool isLoading;
  final bool isVerified;
  final String? errorMessage;

  const VerifyOtpState({
    this.identifier = '',
    this.code = '',
    this.isLoading = false,
    this.isVerified = false,
    this.errorMessage,
  });

  bool get isOtpComplete => code.length == 6;

  VerifyOtpState copyWith({
    String? identifier,
    String? code,
    bool? isLoading,
    bool? isVerified,
    String? errorMessage,
    bool clearError = false,
  }) {
    return VerifyOtpState(
      identifier: identifier ?? this.identifier,
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
      isVerified: isVerified ?? this.isVerified,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
    identifier,
    code,
    isLoading,
    isVerified,
    errorMessage,
  ];
}
