import 'dart:async';

import 'package:animals_guard/helpers/helpers.dart';
import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../helpers/map_marker.dart';
import '../helpers/map_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _mapController = Completer();

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = Set();

  /// Minimum zoom at which the markers will cluster
  final int _minClusterZoom = 0;

  /// Maximum zoom at which the markers will cluster
  final int _maxClusterZoom = 19;

  /// [Fluster] instance used to manage the clusters
  Fluster<MapMarker> _clusterManager;

  /// Current map zoom. Initial zoom will be 15, street level
  double _currentZoom = 10;

  /// Map loading flag
  bool _isMapLoading = true;

  /// Markers loading flag
  bool _areMarkersLoading = true;

  /// Url image used on normal markers
  final String _markerImageUrl =
      'https://img.icons8.com/office/80/000000/marker.png';

  /// Color of the cluster circle
  final Color _clusterColor = Colors.red;

  /// Color of the cluster text
  final Color _clusterTextColor = Colors.white;

  /// Example marker coordinates
  final List<LatLng> _markerLocations = [
    // 1 район
    LatLng(55.737451, 37.635485),
    LatLng(55.738399, 37.629691),
    LatLng(55.744105, 37.633131),
    LatLng(55.744404, 37.639374),
    LatLng(55.739260, 37.633284),
    // 2 район
    LatLng(55.745230, 37.589329),
    LatLng(55.742200, 37.587236),
    LatLng(55.740081, 37.593336),
    LatLng(55.745453, 37.596381),
    LatLng(55.747400, 37.587983),
    // 3 район
    LatLng(55.703251, 37.744612),
    LatLng(55.700679, 37.765426),
    LatLng(55.711950, 37.771445),
    LatLng(55.710027, 37.752481),
    LatLng(55.698761, 37.747846),
  ];

  /// Called when the Google Map widget is created. Updates the map loading state
  /// and inits the markers.
  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);

    setState(() {
      _isMapLoading = false;
    });

    _initMarkers();
  }

  /// Inits [Fluster] and all the markers with network images and updates the loading state.
  void _initMarkers() async {
    final List<MapMarker> markers = [];

    for (LatLng markerLocation in _markerLocations) {
      final BitmapDescriptor markerImage =
          await MapHelper.getMarkerImageFromUrl(_markerImageUrl);

      markers.add(
        MapMarker(
          id: _markerLocations.indexOf(markerLocation).toString(),
          position: markerLocation,
          icon: markerImage,
        ),
      );
    }

    _clusterManager = await MapHelper.initClusterManager(
      markers,
      _minClusterZoom,
      _maxClusterZoom,
    );

    await _updateMarkers();
  }

  /// Gets the markers and clusters to be displayed on the map for the current zoom level and
  /// updates state.
  Future<void> _updateMarkers([double updatedZoom]) async {
    if (_clusterManager == null || updatedZoom == _currentZoom) return;

    if (updatedZoom != null) {
      _currentZoom = updatedZoom;
    }

    setState(() {
      _areMarkersLoading = true;
    });

    final updatedMarkers = await MapHelper.getClusterMarkers(
      _clusterManager,
      _currentZoom,
      _clusterColor,
      _clusterTextColor,
      135,
    );

    _markers
      ..clear()
      ..addAll(updatedMarkers);

    setState(() {
      _areMarkersLoading = false;
    });
  }
  Map<String, double> dataMap = {
    "В рассмотрении": 3,
    "Отказано": 2,
    "Одобрено": 2,
  };
  List<Color> _colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
        height: 200,
        child: PieChart(
          colorList: _colors,
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width / 3.2,
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          legendOptions: LegendOptions(
            showLegendsInRow: true,
            legendPosition: LegendPosition.bottom,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: false,
            showChartValues: false,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Статистика по регионам',
         style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          // Google Map widget
          Container(
            child: GoogleMap(
              mapToolbarEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(55.753215, 37.622504), zoom: _currentZoom),
              markers: _markers,
              onMapCreated: (controller) => _onMapCreated(controller),
              onCameraMove: (position) => _updateMarkers(position.zoom),
            ),
          ),
          
          
          // Map loading indicator
        ],
      ),
    );
  }
}
