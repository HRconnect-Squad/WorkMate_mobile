class SendMessageRequestDto {
  final int receiverId;
  final String message;

  const SendMessageRequestDto({required this.receiverId, required this.message});

  Map<String, dynamic> toJson() => {
    'receiver_id': receiverId,
    'message': message,
  };
}