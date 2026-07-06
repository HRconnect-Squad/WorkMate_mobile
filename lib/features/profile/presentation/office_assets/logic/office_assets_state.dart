import 'package:equatable/equatable.dart';

import '../../../domain/entity/office_asset.dart';

class OfficeAssetsState extends Equatable {
  final List<OfficeAsset> assets;
  final int currentIndex;
  final bool isLoading;
  final String? error;

  const OfficeAssetsState({
    this.assets = const [],
    this.currentIndex = 0,
    this.isLoading = false,
    this.error,
  });

  OfficeAsset? get currentAsset {
    if (assets.isEmpty || currentIndex >= assets.length) return null;
    return assets[currentIndex];
  }

  bool get hasMultipleAssets => assets.length > 1;

  bool get hasAssets => assets.isNotEmpty;
  
  int get totalAssets => assets.length;

  OfficeAssetsState copyWith({
    List<OfficeAsset>? assets,
    int? currentIndex,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return OfficeAssetsState(
      assets: assets ?? this.assets,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [
    assets,
    currentIndex,
    isLoading,
    error,
  ];
}