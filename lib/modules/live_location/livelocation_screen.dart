import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/cubit.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/states.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:location/location.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
BitmapDescriptor user_icon = BitmapDescriptor.defaultMarker;
BitmapDescriptor train_icon= BitmapDescriptor.defaultMarker;
class LiveLocationScreen extends StatelessWidget {
  final String trainNump;

  const LiveLocationScreen({
    required this. trainNump,
    super.key,
  });
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (contextt) => MapsCubit()..setCustomMarkerIcon()..getTrainLocation(),
      child: BlocConsumer<MapsCubit,MapsStates>(
        listener:(context, state) => {},
        builder:  (context, state) {
          maps_cubic=MapsCubit.get(context);
          maps_cubic!.trainNump=trainNump;
          return Scaffold(
          body: GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(trian_location_lat,trian_location_long),
              zoom:5,
            ),
            markers: Set<Marker>.of(MapsCubit.get(context).markers.values),
            onMapCreated: (mapController)async {
              MapsCubit.get(context).controller.complete(mapController);
              MapsCubit.get(context).addMarker(LatLng(trian_location_lat,trian_location_long), "train",train_icon);
              MapsCubit.get(context).mapController=mapController;

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
        );}
      ),
    );
  }
}




