import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/enitity/UserLocation.dart';

enum ClockInFlowStatus {
  initial,
  loadingLocation,
  locationReady,
  loadingCamera,
  cameraReady,
  capturingPhoto,
  photoCaptured,
  submittingClockIn,
  success,
  error,
}

class ClockInFlowState extends Equatable {

  final ClockInFlowStatus status;
  final String? errorMessage;

  final Location? userLocation;
  final bool isPopupVisible;

  final String? userName;
  final String? userImageUrl;

  final CameraController? cameraController;
  final XFile? capturedImage;
  final bool isFlashOn;
  final double currentZoomLevel;
  final double maxZoomLevel;

  final String? notes;
  final DateTime? submissionTime;

  const ClockInFlowState({
    this.status = ClockInFlowStatus.initial,
    this.errorMessage,

    this.userLocation,
    this.isPopupVisible = false,

    this.userName,
    this.userImageUrl,

    this.cameraController,
    this.capturedImage,
    this.isFlashOn = false,
    this.currentZoomLevel = 1.0,
    this.maxZoomLevel = 1.0,

    this.notes,
    this.submissionTime,
  });

  ClockInFlowState copyWith({
    ClockInFlowStatus? status,
    String? errorMessage,
    bool clearErrorMessage = false,
    Location? userLocation,
    bool? isPopupVisible,
    String? userName,
    String? userImageUrl,
    CameraController? cameraController,
    XFile? capturedImage,
    bool? isFlashOn,
    double? currentZoomLevel,
    double? maxZoomLevel,
    String? notes,
    DateTime? submissionTime,
  }) {
    return ClockInFlowState(
      status: status ?? this.status,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
      userLocation: userLocation ?? this.userLocation,
      isPopupVisible: isPopupVisible ?? this.isPopupVisible,
      userName: userName ?? this.userName,
      userImageUrl: userImageUrl ?? this.userImageUrl,
      cameraController: cameraController ?? this.cameraController,
      capturedImage: capturedImage ?? this.capturedImage,
      submissionTime: submissionTime ?? this.submissionTime,
      isFlashOn: isFlashOn ?? this.isFlashOn,
      currentZoomLevel: currentZoomLevel ?? this.currentZoomLevel,
      maxZoomLevel: maxZoomLevel ?? this.maxZoomLevel,
      notes: notes ?? this.notes,
    );
  }

  bool get isLocationLoading => status == ClockInFlowStatus.loadingLocation;
  bool get isLocationReady => status == ClockInFlowStatus.locationReady;

  bool get isCameraReady => status == ClockInFlowStatus.cameraReady;
  bool get isCapturing => status == ClockInFlowStatus.capturingPhoto;
  bool get hasImage => capturedImage != null;

  bool get isSubmitting => status == ClockInFlowStatus.submittingClockIn;
  bool get isSuccess => status == ClockInFlowStatus.success;
  bool get hasError => status == ClockInFlowStatus.error;

  bool get canSubmitClockIn => hasImage && userLocation != null;

  String get locationCoordinates {
    if (userLocation == null) return "---";
    return "Lat ${userLocation!.latitude.toStringAsFixed(5)} Long ${userLocation!.longitude.toStringAsFixed(5)}";
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        userLocation,
        isPopupVisible,
        userName,
        userImageUrl,
        cameraController,
        capturedImage,
        isFlashOn,
        currentZoomLevel,
        maxZoomLevel,
        notes,
        submissionTime,
      ];
}
