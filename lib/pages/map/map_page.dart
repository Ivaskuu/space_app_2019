import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart' as ltln;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:space_app_2019/managers/api_manager.dart';
import 'package:tuple/tuple.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const MIN_ZOOM = 7.0;
  static const MAX_ZOOM = 15.0;

  MapboxMapController mapController;
  CameraPosition _position = const CameraPosition(
    target: LatLng(45.5076664, 9.1540164),
    zoom: 15.0,
  );

  LatLng _lastPos;
  double _lastZoom;

  List<ltln.LatLng> fires = [];
  List<ltln.LatLng> lastVisibleFires = [];
  List<Symbol> _symbols = [];
  bool _isComputingMarkers = false;

  // static List<>

  @override
  void initState() {
    super.initState();

    ApiManager.getFiresPosition().then((List positions) {
      print('got ${positions.length} positions from api');
      setState(() => fires = positions);
    });
  }

  @override
  void dispose() {
    super.dispose();
    mapController?.dispose();
  }

  void _onMapInit(MapboxMapController controller) {
    mapController = controller;
    mapController.addListener(_onMapUpdate);
  }

  static List<ltln.LatLng> computePointsPos(
      Tuple3<List<ltln.LatLng>, ltln.LatLng, double> args) {
    final fires = args.item1;
    final camPos = args.item2;
    final distance = args.item3;

    print(camPos);
    print(distance);
    print('starting computing visible fires');

    final visibleFires = fires.where(
      (point) {
        try {
          return ltln.Distance().as(
                ltln.LengthUnit.Kilometer,
                ltln.LatLng(point.latitude, point.longitude),
                ltln.LatLng(camPos.latitude, camPos.longitude),
              ) <=
              distance;
        } catch (ex) {
          print('error $ex');
          return false;
        }
      },
    ).toList();

    print('finished computing visible fires');

    return visibleFires.take(1000).toList();
  }

  void _onMapUpdate() async {
    if (fires.length > 0 &&
        !_isComputingMarkers &&
        !mapController.isCameraMoving &&
        (_lastZoom != mapController.cameraPosition.zoom ||
            _lastPos.latitude != mapController.cameraPosition.target.latitude ||
            _lastPos.latitude !=
                mapController.cameraPosition.target.latitude)) {
      _lastZoom = mapController.cameraPosition.zoom;
      _lastPos = mapController.cameraPosition.target;

      final zoom = mapController.cameraPosition.zoom;
      final mPerPixels = 156543.03392 *
          cos(mapController.cameraPosition.target.latitude * pi / 180) /
          pow(2, zoom);

      final hKM = (mPerPixels * MediaQuery.of(context).size.width) / 1000.0;

      final camPos = ltln.LatLng(
        mapController.cameraPosition.target.latitude,
        mapController.cameraPosition.target.longitude,
      );

      _isComputingMarkers = true;

      final result = await compute(
        computePointsPos,
        Tuple3(fires, camPos, hKM),
      );

      final resultCopy = List<ltln.LatLng>.from(result);

      print(result.length);
      result.removeWhere((point) => lastVisibleFires.contains(point));

      final markersToAdd = result
        ..removeWhere((point) => lastVisibleFires.contains(point));
      final markersToDelete = lastVisibleFires;

      print(markersToAdd);
      print(markersToDelete);

      markersToAdd.forEach(
        (point) {
          // print('i want to add symbol');
          mapController.addSymbol(
            SymbolOptions(
              textField: '•',
              textColor: '#FF0000',
              geometry: LatLng(point.latitude, point.longitude),
            ),
          )..then((s) => _symbols.add(s));
        },
      );

      // markersToDelete.forEach(
      //   (point) {
      //     // print('i want to add symbol');
      //     mapController.removeSymbol(_symbols.firstWhere((s) =>
      //         s.options.geometry == LatLng(point.latitude, point.longitude)));
      //   },
      // );

      print(resultCopy.length);
      lastVisibleFires = resultCopy;

      setState(() => _isComputingMarkers = false);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      onMapCreated: _onMapInit,
      styleString: MapboxStyles
          .SATELLITE_STREETS, //r'mapbox://styles/ivaskuu/ck1xg2mhg0qz81co908w1fxd6',
      initialCameraPosition: _position,
      tiltGesturesEnabled: false,
      rotateGesturesEnabled: false,
      minMaxZoomPreference: MinMaxZoomPreference(MIN_ZOOM, MAX_ZOOM),
      myLocationEnabled: false,
      trackCameraPosition: true,
    );
  }
}
