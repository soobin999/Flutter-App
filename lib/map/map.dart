import 'dart:typed_data';

import 'package:example/drawer/drawer.dart';
import 'package:example/page/listview.dart';
import 'package:example/temp/temp.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:google_place/google_place.dart';

class googleMap extends StatefulWidget {
  @override
  _googleMapState createState() => _googleMapState();
}

class _googleMapState extends State<googleMap> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(37.575929, 126.976849);

  static final gwanghwamun = CameraPosition(
    target: const LatLng(37.575929, 126.976849),
    zoom: 15.0,
  );

  LatLng _lastMapPosition = _center;

  void _sd() {
    print('안녕하신가요?');
    print('안녕하신가요?');
  }

  Set<Marker> _createMarker = {};

  _onCameraMove(CameraPosition _position) {
    _lastMapPosition = _position.target;
    setState(() {
      _createMarker.clear();
      _createMarker.add(Marker(
        markerId: MarkerId('marker_1'),
        position: LatLng(_position.target.latitude, _position.target.longitude),
        draggable: true,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("검색할 위치 설정"),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.access_alarms_sharp),
            onPressed: () => {me()},
          ),
        ],
      ),
      body: Center(
          child: Container(
              child: (GoogleMap(
        initialCameraPosition: gwanghwamun,
        onCameraMove: ((_postion) => _onCameraMove(_postion)),
        markers: _createMarker,
      )))),
    );
  }

  Set<Marker> _tempMarker() {
    return null;
  }

  var results;

  Future<List<Uint8List>> getPhoto(List<Photo> photoReference) async {
    List<Uint8List> images = [];

    for (int i = 0; i < photoReference.length; i++) {
      var googlePlace;
      var result = await googlePlace.photos.get(photoReference, null, 400);
      if (result != null) {
        images.add(result);
      }
    }

    return images;
  }

  Future<void> me() async {
    var googlePlace = GooglePlace("AIzaSyDxMnZ2cg6r8kaiT7j0iwjIPX1eKN28KEs");
    var result = await googlePlace.search.getNearBySearch(
      Location(
          lat: _createMarker.toList()[0].position.latitude,
          lng: _createMarker.toList()[0].position.longitude),
      200,
      type: "restaurant",
    );
    /*_createMarker.clear();
    for (int i = 0; i < result.results.length; i++) {
      setState(() {});
      _createMarker.add(Marker(
        markerId: MarkerId('marker_$i'),
        position: LatLng(result.results[i].geometry.location.lat,
            result.results[i].geometry.location.lng),
        icon: BitmapDescriptor.defaultMarker,

      ));
    }*/
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => temp(results: result.results)));
  }
}
