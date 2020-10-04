import 'package:animals_guard/alerts/check_geo_alert.dart';
import 'package:animals_guard/pages/news_feed_page/map/pages/home_page.dart';
import 'package:animals_guard/repos/user_repository.dart';
import 'package:animals_guard/services/geo_funcs.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:animals_guard/models/point.dart';

class MapForStats extends StatefulWidget {
  MapForStats({Key key}) : super(key: key);

  @override
  _MapForStatsState createState() => _MapForStatsState();
}

class _MapForStatsState extends State<MapForStats> {
  _MapForStatsState();

  Set<Marker> _markers = new Set<Marker>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    double _adaptiveHeight(double size) => height * (size / 740);
    return HomePage();
  }
}
