enum Gender {
  male,
  female,
  unspecified;

  static Gender fromString(String value) {
    return Gender.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => Gender.unspecified,
    );
  }
}
