class ValidationErrors {
  final Map<String, List<String>> fields;

  const ValidationErrors(this.fields);

  List<String>? errorsFor(String field) => fields[field];

  String? firstErrorFor(String field) => fields[field]?.firstOrNull;

  List<String> get allErrors =>
      fields.values.expand((messages) => messages).toList();

  String get combinedErrors => allErrors.join('\n');

  bool get isEmpty => fields.isEmpty;

  bool get isNotEmpty => fields.isNotEmpty;

  bool containsField(String field) => fields.containsKey(field);
}