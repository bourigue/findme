import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: const FindMe(),
    );
  }
}

class FindMe extends StatefulWidget {
  const FindMe({Key? key}) : super(key: key);
  @override
  State<FindMe> createState() => _FindMeState();
}

class _FindMeState extends State<FindMe> {
late bool services;
Position ? c;
LocationPermission ? per;
var lat;
var long;
 late  CameraPosition _kGooglePlex="" as CameraPosition;
Future getper ()async{
  services=await Geolocator.isLocationServiceEnabled();
  per=await Geolocator.checkPermission();

  if(per==LocationPermission.always){
    getLaLon();
  }
  return per;
}

Future <void> getLaLon()async{

  c=await Geolocator.getCurrentPosition().then((value) => value);
  lat=c?.latitude;
  long=c?.longitude;
   _kGooglePlex = CameraPosition(

    target: LatLng(lat, long),
    zoom: 15,
  );



  setState(() {
});

}
Completer<GoogleMapController> _controller = Completer();

@override
  void initState() {
    getper ();
    super.initState();
  }

  @override
    Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(

        child:SingleChildScrollView(
          child: Column(children: [

       ElevatedButton(onPressed: () async {


         }

       , child: Text("ertyhujk")),Container(
              height: 500,
              width: 500,
              child:  GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),)

      ],),
        ),),
    );
  }
}
