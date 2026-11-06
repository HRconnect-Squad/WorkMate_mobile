import 'package:equatable/equatable.dart';

class ChatContact extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String? phone;
  final String? profileImage;

  const ChatContact({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    this.profileImage,
  });

  String get displayName =>
      fullName.trim().isNotEmpty ? fullName.trim() : email;

  @override
  List<Object?> get props => [id, fullName, email, phone, profileImage];
}