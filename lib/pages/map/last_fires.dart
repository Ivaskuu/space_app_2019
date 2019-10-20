import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart' as ltln;
import 'dart:math';

Random _random;

class LastFires extends StatelessWidget {
  final List<ltln.LatLng> _lastVisibleFires;
  LastFires(this._lastVisibleFires);
  @override
  Widget build(BuildContext context) {
    _random = new Random(3);
    return SizedBox(
      width: double.infinity,
      height: 256.0,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 256.0,
              child: (_lastVisibleFires?.length ?? 0) == 0
                  ? Center(
                      child: Text('No fires found in this area'),
                    )
                  : ListView.builder(
                      itemCount: _lastVisibleFires.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                            initialData: [],
                            future: Geocoder.local.findAddressesFromCoordinates(
                              Coordinates(_lastVisibleFires[index].latitude,
                                  _lastVisibleFires[index].longitude),
                            ),
                            builder: (context, snapshot) {
                              int n = _random.nextInt(3);
                              return snapshot.hasData
                                  ? ListTile(
                                      trailing: Text(
                                        n == 0
                                            ? 'Low'
                                            : n == 1 ? 'Med' : 'High',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: n == 0
                                                ? Colors.black
                                                : n == 1
                                                    ? Colors.amber
                                                    : Color.fromRGBO(
                                                        252, 59, 28, 1)),
                                      ),
                                      title: Text(snapshot.data[0].locality ??
                                          'Unnamed locality'),
                                      subtitle: Text(
                                          snapshot.data[0].addressLine ?? ''),
                                    )
                                  : Container();
                            });
                      }),
            ),
            Container(
              width: double.infinity,
              height: 32.0,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Fires location',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_up),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
