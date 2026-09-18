enum LeaveStatus {
  pending,
  approved,
  rejected,
  cancelled;

  static LeaveStatus fromString(String value) {
    return LeaveStatus.values.firstWhere(
          (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => LeaveStatus.pending,
    );
  }
}