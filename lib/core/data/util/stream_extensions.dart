extension StreamNullFilter<T extends Object> on Stream<T?> {
  Stream<T> whereNotNull() =>
      expand<T>((event) => event == null ? <T>[] : <T>[event]);
}