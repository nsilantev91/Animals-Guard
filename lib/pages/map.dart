import 'package:animals_guard/services/geo_funcs.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:animals_guard/models/point.dart';

Geolocator geolocator = new Geolocator();

//страница карты
// ignore: must_be_immutable
class GMap extends StatefulWidget {
  Point del;

  GMap({Key key, this.del}) : super(key: key);

  @override
  _GMapState createState() => _GMapState(del: del);
}

class _GMapState extends State<GMap> {
  Point del;
  _GMapState({this.del});
  String addres;
  Marker deliever;
  Set<Marker> _markers = new Set<Marker>()
    ..add(
      Marker(
          markerId: MarkerId("Market"),
          position: LatLng(0.0, 0.0),
          infoWindow: InfoWindow(title: "Еда как есть"),
          icon: BitmapDescriptor.defaultMarker),
    );
  @override
  void initState() {
    deliever = new Marker(
        markerId: MarkerId("deliever"),
        position: del.position,
        draggable: true,
        infoWindow: InfoWindow(title: "Адрес."),
        icon: BitmapDescriptor.defaultMarker);
    _markers.add(deliever);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _updatePosition(CameraPosition _position) {
      print(
          'inside updatePosition ${_position.target.latitude} ${_position.target.longitude}');
      _markers.remove(deliever);
      deliever = deliever.copyWith(
          positionParam:
              LatLng(_position.target.latitude, _position.target.longitude));
      _markers.add(deliever);
      setState(() {});
    }

    var height = MediaQuery.of(context).size.height;
    double _adaptiveHeight(double size) => height * (size / 740);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            markers: _markers,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onCameraMove: ((_position) => _updatePosition(_position)),
            initialCameraPosition:
                new CameraPosition(target: deliever.position, zoom: 18),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () async {
                  del = await Geo.getAddressFromLatLng(deliever.position);
                  print(del.caption);
                  Navigator.pop(context, del);
                }),
          ),
        ],
      ),
    );
  }
}

Future<String> getPositionName(LatLng position) async {
  List<Placemark> p = await geolocator.placemarkFromCoordinates(
      position.latitude, position.longitude);

  Placemark place = p[0];

  return ("${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.thoroughfare} ${place.name}");
}
