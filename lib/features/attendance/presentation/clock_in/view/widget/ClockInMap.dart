import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/presentation/design_system/components/custom_clockin_area_map_user.dart';
import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/ClockInFlowStatus.dart';

class ClockInMap extends StatelessWidget {
  final VoidCallback onMarkerTap;
  final ClockInFlowState clockInFlowState;

  const ClockInMap({
    super.key,
    required this.onMarkerTap,
    required this.clockInFlowState,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(
          clockInFlowState.userLocation?.latitude ?? 0,
          clockInFlowState.userLocation?.longitude ?? 0,
        ),
        initialZoom: 15,
        minZoom: 14,
        maxZoom: 16,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.maptiler.com/maps/hybrid/{z}/{x}/{y}.png?key=54uUzuarknk6ofvWlZlV',
        ),

        CircleLayer(
          circles: [
            CircleMarker(
              point: LatLng(
                clockInFlowState.userLocation?.latitude ?? 0,
                clockInFlowState.userLocation?.longitude ?? 0,
              ),
              radius: 220,
              useRadiusInMeter: true,
              color: ExtensionColors.backgroundCircleMap.withOpacity(0.2),
              borderColor: context.colors.purple500,
              borderStrokeWidth: 2,
            ),
          ],
        ),

        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(
                clockInFlowState.userLocation?.latitude ?? 0,
                clockInFlowState.userLocation?.longitude ?? 0,
              ),
              width: 56,
              height: 56,
              child: GestureDetector(
                onTap: onMarkerTap,
                child: CustomClockInAreaMapUser(
                  imageUrl: clockInFlowState.userImageUrl ?? "",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
