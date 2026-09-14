class AppTabItem<T> {
  final T value;
  final String label;
  final int? count;

  const AppTabItem({
    required this.value,
    required this.label,
    this.count,
  });
}