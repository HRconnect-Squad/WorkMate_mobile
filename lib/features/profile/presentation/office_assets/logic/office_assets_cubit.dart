import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/usecase/get_office_assets_usecase.dart';
import 'office_assets_state.dart';

class OfficeAssetsCubit extends BaseCubit<OfficeAssetsState> {
  final GetOfficeAssetsUseCase _getOfficeAssetsUseCase;

  OfficeAssetsCubit({
    required GetOfficeAssetsUseCase getOfficeAssetsUseCase,
  })  : _getOfficeAssetsUseCase = getOfficeAssetsUseCase,
        super(const OfficeAssetsState());

  Future<void> loadAssets() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearError: true,
      )),
      call: () => _getOfficeAssetsUseCase(),
      onSuccess: (assets) {
        updateState((s) => s.copyWith(
          isLoading: false,
          assets: assets,
          currentIndex: 0,
        ));
      },
      onError: (error) {
        updateState((s) => s.copyWith(
          isLoading: false,
          error: error.message,
        ));
      },
    );
  }

  void onAssetChanged(int index) {
    if (index >= 0 && index < state.assets.length) {
      updateState((s) => s.copyWith(currentIndex: index));
    }
  }

  void nextAsset() {
    if (state.currentIndex < state.assets.length - 1) {
      updateState((s) => s.copyWith(currentIndex: state.currentIndex + 1));
    }
  }

  void previousAsset() {
    if (state.currentIndex > 0) {
      updateState((s) => s.copyWith(currentIndex: state.currentIndex - 1));
    }
  }

  void clearError() {
    updateState((s) => s.copyWith(clearError: true));
  }

  Future<void> refresh() async {
    await loadAssets();
  }
}