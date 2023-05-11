import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/states.dart';
import 'package:graduation_proj''ect_app/modules/live_location/livelocation_screen.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:location/location.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/mqtt.dart';
class MapsCubit extends Cubit<MapsStates>{
  MapsCubit():super (MapsInitialState());
  static MapsCubit get(context)=>BlocProvider.of(context);
  LocationData? currentLocation;
  GoogleMapController? mapController;
  String trainNump='';
  Map<MarkerId, Marker> markers = {};
  MqttHandler mqttHandler = MqttHandler();
  List<LatLng> markersLocations=[LatLng(trian_location_lat,trian_location_long),const LatLng( 0.0, 0.0)];
  final Completer<GoogleMapController> controller = Completer();
  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/train_icon.png")
        .then(
          (icon) {
          train_icon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/user_icon.png")
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
    CameraPosition(
      target: LatLng(trian_location_lat,trian_location_long),
      zoom:8,
    );
    emit(MapTrainChangeState());
  }
  void getCurrentLocation(location) {
    location.getLocation().then(
          (locationn)async {
        currentLocation = locationn;
        location.onLocationChanged.listen(
              (newLoc) {
                markersLocations[1]=LatLng( newLoc.latitude!, newLoc.longitude!,);
                addMarker(LatLng( newLoc.latitude!, newLoc.longitude!,), "user",user_icon);
                mapController?.animateCamera(CameraUpdate.newLatLngBounds(getLatLngBounds(markersLocations),20));
                currentLocation = newLoc;

            emit(MapUserChangeState());
          },
        );
      },
    );

  }
  void getTrainLocation(){
    mqttHandler.connect(trainNump);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhh        "+mqttHandler.data.toString());
  }
 LatLngBounds getLatLngBounds(List<LatLng> list) {
    double ?x0, x1, y0, y1;
      for (final latLng in list) {
        if (x0 == null) {
          x0 = x1 = latLng.latitude;
          y0 = y1 = latLng.longitude;
        } else {
          if (latLng.latitude > x1!) x1 = latLng.latitude;
          if (latLng.latitude < x0) x0 = latLng.latitude;
          if (latLng.longitude > y1!) y1 = latLng.longitude;
          if (latLng.longitude < y0!) y0 = latLng.longitude;
        }
      }
      return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));

  }
}

