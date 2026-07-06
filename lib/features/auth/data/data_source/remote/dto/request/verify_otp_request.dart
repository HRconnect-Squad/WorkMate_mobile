import '../../../../../domain/entity/verification_type.dart';

class VerifyOtpRequest {
  VerifyOtpRequest({
    required this.identifier,
    required this.code,
    required this.type,
  });

  String identifier;
  String code;
  VerificationType type;

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'code': code,
      'type': type.name,
    };
  }
}
