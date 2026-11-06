import 'package:equatable/equatable.dart';

class PagedResult<T> extends Equatable {
  final List<T> items;
  final int currentPage;
  final int lastPage;

  const PagedResult({
    required this.items,
    required this.currentPage,
    required this.lastPage,
  });

  bool get hasMore => currentPage < lastPage;

  @override
  List<Object?> get props => [items, currentPage, lastPage];
}