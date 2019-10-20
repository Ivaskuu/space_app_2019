import 'package:flutter/material.dart';

class RiskZonePage extends StatefulWidget {
  @override
  _RiskZonePageState createState() => _RiskZonePageState();
}

class _RiskZonePageState extends State<RiskZonePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 24.0 + 16.0),
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
      ],
    );
  }
}
