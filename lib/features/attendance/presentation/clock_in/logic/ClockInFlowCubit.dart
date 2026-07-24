import 'dart:io';

import 'package:camera/camera.dart';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../core/presentation/util/image_picker_helper.dart';
import '../../../domain/enitity/attendanceclockIn.dart';
import '../../../domain/use_case/GetCurrentLocationUseCase.dart';
import '../../../domain/use_case/clock_in_attendance_use_case.dart';
import '../../../domain/use_case/getUserInfoUseCase.dart';
import '../../attendance_notifier/attendance_notifier.dart';
import 'ClockInFlowStatus.dart';

class ClockInFlowCubit extends BaseCubit<ClockInFlowState> {
  final GetCurrentLocationUseCase _getCurrentLocation;
  final GetUserInfoUseCase _getUserInfo;
  final ClockInAttendanceUseCase _clockInAttendance;
  final AttendanceNotifier _attendanceNotifier;

  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  double _minZoomLevel = 1.0;

  ClockInFlowCubit({
    required GetCurrentLocationUseCase getCurrentLocation,
    required GetUserInfoUseCase getUserInfo,
    required ClockInAttendanceUseCase clockInAttendance,
    required AttendanceNotifier attendanceNotifier,
  })  : _getCurrentLocation = getCurrentLocation,
        _getUserInfo = getUserInfo,
        _clockInAttendance = clockInAttendance,
        _attendanceNotifier = attendanceNotifier,
        super(ClockInFlowState()) {
    _initLocation();
  }

  // ═══════════════════════════════════════════════════════════
  //  STEP 1: LOCATION SCREEN
  // ═══════════════════════════════════════════════════════════

  Future<void> _initLocation() async {
    updateState((s) => s.copyWith(
          status: ClockInFlowStatus.loadingLocation,
          clearErrorMessage: true,
        ));

    await _loadUserData();
    await _loadUserLocation();
  }

  Future<void> retryLoadLocation() async {
    await _initLocation();
  }

  Future<void> _loadUserData() async {
    await execute(
      onLoading: () {},
      call: () => _getUserInfo(),
      onSuccess: (user) {
        updateState(
          (s) => s.copyWith(
            userName: user.firstname,
            userImageUrl: user.imageUser,
          ),
        );
      },
      onError: (e) {
        updateState(
          (s) => s.copyWith(
            status: ClockInFlowStatus.error,
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  Future<void> _loadUserLocation() async {
    await execute(
      call: () => _getCurrentLocation(),
      onSuccess: (location) async {
        updateState(
          (s) => s.copyWith(
            userLocation: location,
            status: ClockInFlowStatus.locationReady,
          ),
        );
      },
      onError: (e) {
        updateState(
          (s) => s.copyWith(
            status: ClockInFlowStatus.error,
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  void togglePopup() {
    updateState((s) => s.copyWith(isPopupVisible: !state.isPopupVisible));
  }

  // ═══════════════════════════════════════════════════════════
  //  STEP 2: CAMERA SCREEN
  // ═══════════════════════════════════════════════════════════

  Future<void> initializeCamera() async {
    try {
      updateState((s) => s.copyWith(
            status: ClockInFlowStatus.loadingCamera,
            clearErrorMessage: true,
          ));

      _cameras = await availableCameras();

      final camera = _cameras!.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras!.first,
      );

      await _setupCamera(camera);
    } catch (e) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "Camera initialization failed",
        ),
      );
    }
  }

  Future<void> retryInitializeCamera() async {
    await initializeCamera();
  }

  Future<void> _setupCamera(CameraDescription camera) async {
    await _cameraController?.dispose();

    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await _cameraController!.initialize();
    await _cameraController!.setFlashMode(FlashMode.off);

    final maxZoom = await _cameraController!.getMaxZoomLevel();
    _minZoomLevel = await _cameraController!.getMinZoomLevel();

    updateState(
      (s) => s.copyWith(
        status: ClockInFlowStatus.cameraReady,
        cameraController: _cameraController,
        currentZoomLevel: _minZoomLevel,
        maxZoomLevel: maxZoom,
        isFlashOn: false,
      ),
    );
  }

  Future<void> takePicture() async {
    if (_cameraController == null ||
        !_cameraController!.value.isInitialized) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "Camera not ready",
        ),
      );
      return;
    }

    try {
      updateState(
        (s) => s.copyWith(status: ClockInFlowStatus.capturingPhoto),
      );

      final image = await _cameraController!.takePicture();

      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.photoCaptured,
          capturedImage: image,
        ),
      );
    } catch (e) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "Failed to capture photo: $e",
        ),
      );
    }
  }

  Future<void> toggleFlash() async {
    if (_cameraController == null ||
        !_cameraController!.value.isInitialized) {
      return;
    }
    try {
      final newMode = state.isFlashOn ? FlashMode.off : FlashMode.torch;
      await _cameraController!.setFlashMode(newMode);
      updateState((s) => s.copyWith(isFlashOn: !state.isFlashOn));
    } catch (e) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "Failed to toggle flash",
        ),
      );
    }
  }

  Future<void> adjustZoom() async {
    if (_cameraController == null ||
        !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      final min = _minZoomLevel;
      final max = state.maxZoomLevel;
      final mid = (min + max) / 2;
      final current = state.currentZoomLevel;

      final newZoom = current <= min
          ? mid
          : current < max
              ? max
              : min;

      await _cameraController!.setZoomLevel(newZoom);
      updateState((s) => s.copyWith(currentZoomLevel: newZoom));
    } catch (e) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "Failed to adjust zoom",
        ),
      );
    }
  }

  void retakePicture() {
    updateState(
      (s) => s.copyWith(
        status: ClockInFlowStatus.cameraReady,
        capturedImage: null,
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // ✅ STEP 3: CONFIRMATION SCREEN
  // ═══════════════════════════════════════════════════════════

  void updateNotes(String notes) {
    updateState((s) => s.copyWith(notes: notes));
  }

  Future<void> submitClockIn() async {
    final image = state.capturedImage;
    final location = state.userLocation;

    if (image == null || location == null) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "image_proof or location InValiad",
        ),
      );
      return;
    }

    final imageFile = File(image.path);

    if (!ImagePickerHelper.isValidImageExtension(imageFile)) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "Invalid image format",
        ),
      );
      return;
    }

    if (!ImagePickerHelper.isFileSizeValid(imageFile)) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.error,
          errorMessage: "Image size too large",
        ),
      );
      return;
    }

    updateState(
      (s) => s.copyWith(status: ClockInFlowStatus.submittingClockIn),
    );

    await execute(
      call: () => _clockInAttendance(
        attendanceClockIn: ClockInAttendance(
          latitude: location.latitude,
          longitude: location.longitude,
          notes: state.notes ?? "",
          proofImage: image.path,
        ),
      ),
      onSuccess: (_) {
        updateState(
          (s) => s.copyWith(
            status: ClockInFlowStatus.success,
            submissionTime: DateTime.now(),
          ),
        );
        _attendanceNotifier.notifyClockInSuccess();
      },
      onError: (e) {
        updateState(
          (s) => s.copyWith(
            status: ClockInFlowStatus.error,
            errorMessage: e.message,
          ),
        );
      },
    );
  }

  void clearError() {
    if (state.hasError) {
      updateState(
        (s) => s.copyWith(
          status: ClockInFlowStatus.locationReady,
          clearErrorMessage: true,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _cameraController?.dispose();
    return super.close();
  }
}
