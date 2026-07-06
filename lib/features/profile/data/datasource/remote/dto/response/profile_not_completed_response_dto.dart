class ProfileNotCompletedResponseDto {
  final bool profileCompleted;

  const ProfileNotCompletedResponseDto({
    required this.profileCompleted,
  });

  factory ProfileNotCompletedResponseDto.fromJson(Map<String, dynamic> json) {
    return ProfileNotCompletedResponseDto(
      profileCompleted: json['profile_completed'] as bool? ?? false,
    );
  }
}