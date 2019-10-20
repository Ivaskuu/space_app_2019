import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class RiskZonePage extends StatefulWidget {
  @override
  _RiskZonePageState createState() => _RiskZonePageState();
}

class _RiskZonePageState extends State<RiskZonePage> {
  double _alignX = 0.0;
  bool _hasSearched = false;

  bool _forward = true;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 5), (t) {
      if (!mounted)
        t.cancel();
      else {
        setState(() {
          _alignX += _forward ? 0.001 : -0.001;
          if (_alignX >= 1.0)
            _forward = false;
          else if (_alignX <= 0.0) _forward = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        if (!_hasSearched)
          Image.asset(
            'res/RenderData.jpg',
            fit: BoxFit.cover,
            alignment: Alignment(_alignX, 0.0),
          ),
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ).copyWith(top: 24.0 + 16.0),
              child: SizedBox(
                height: 64.0,
                child: Material(
                  elevation: 6.0,
                  shadowColor: Colors.black45,
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(12.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onSubmitted: (_) => Future.delayed(
                              Duration(milliseconds: 500),
                              () => setState(() => _hasSearched = true),
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: 'Search for a place',
                            ),
                          ),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (_hasSearched)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Material(
                  elevation: 6.0,
                  shadowColor: Colors.black45,
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(12.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(width: 14.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Politecnico di Milano - Edificio BL.27',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Via Raffaele Lambruschini, 4, 20156 Milano MI',
                                style: TextStyle(
                                  // siz
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (_hasSearched)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.black45,
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(12.0),
                    child: IgnorePointer(
                      child: MapboxMap(
                        styleString: MapboxStyles.SATELLITE_STREETS,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(45.5036562, 9.1552517),
                          zoom: 15.0,
                        ),
                        tiltGesturesEnabled: false,
                        rotateGesturesEnabled: false,
                        myLocationEnabled: false,
                        trackCameraPosition: true,
                      ),
                    ),
                  ),
                ),
              ),
            if (_hasSearched)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ).copyWith(right: 8.0),
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.black45,
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Fire probability risk',
                                style: TextStyle(
                                  // fontSize: 72.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '~0%',
                                style: TextStyle(
                                  fontSize: 48.0,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ).copyWith(left: 8.0),
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.black45,
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Fires last year',
                                style: TextStyle(
                                  // fontSize: 72.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    IconData(0xe900, fontFamily: 'Icons'),
                                    color: Color.fromRGBO(252, 59, 28, 1)
                                        .withOpacity(0.8),
                                    size: 35.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 48.0,
                                      color: Color.fromRGBO(252, 59, 28, 1)
                                          .withOpacity(0.8),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
