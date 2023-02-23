import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/cubit.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/states.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../shared/variables.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
BitmapDescriptor user_icon = BitmapDescriptor.defaultMarker;
BitmapDescriptor train_icon= BitmapDescriptor.defaultMarker;
class LiveLocationScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsCubit()..setCustomMarkerIcon(),
      child: BlocConsumer<MapsCubit,MapsStates>(
        listener:(context, state) => {},
        builder:  (context, state) => Scaffold(
          appBar: bar(context: context, text: 'Live location', morelist: false),
          body: GoogleMap(
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(trian_location_lat,trian_location_long),
              zoom:8,
            ),
            markers: Set<Marker>.of(MapsCubit.get(context).markers.values),
            onMapCreated: (mapController)async {
              MapsCubit.get(context).controller.complete(mapController);
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor:  colortheme.lightPurple,
            child: const Icon(Icons.location_searching,
              color:Colors.white,
            ),
            onPressed: (){
              try{
                Location location = Location();
                MapsCubit.get(context).getCurrentLocation(location);
              }on PlatformException catch (e) {
                if (e.code == 'PERMISSION_DENIED') {
                  debugPrint("Permission Denied");
                }
              }
            },
          )

          ,
        ),
      ),
    );
  }
}




