import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/states.dart';
import 'package:graduation_proj''ect_app/modules/live_location/livelocation_screen.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:location/location.dart';

class MapsCubit extends Cubit<MapsStates>{
  MapsCubit():super (MapsInitialState());
  static MapsCubit get(context)=>BlocProvider.of(context);
  LocationData? currentLocation;
  Map<MarkerId, Marker> markers = {};
  final Completer<GoogleMapController> controller = Completer();
  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "images/train_icon.png")
        .then(
          (icon) {
          train_icon = icon;
          addMarker(LatLng(trian_location_lat,trian_location_long), "train",train_icon);
      },
    );
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "images/user_icon.png")
        .then(
            (icon) {
              user_icon = icon;
        });

  }
  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
    emit(MapTrainChangeState());
  }
  void getCurrentLocation(location) {
    location.getLocation().then(
          (locationn)async {
        currentLocation = locationn;
        GoogleMapController googleMapController = await controller.future;
        location.onLocationChanged.listen(
              (newLoc) {
            addMarker(LatLng( newLoc.latitude!, newLoc.longitude!,), "user",user_icon);
            currentLocation = newLoc;
            googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  zoom: 7,
                  target: LatLng(
                    newLoc.latitude!,
                    newLoc.longitude!,
                  ),
                ),
              ),
            );
            emit(MapUserChangeState());
          },
        );
      },
    );

  }
}

