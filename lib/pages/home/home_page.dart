import 'package:flutter/material.dart';
import 'package:space_app_2019/pages/map/map_page.dart';
import 'package:provider/provider.dart';
import 'package:space_app_2019/pages/home/pageWidget.dart';
import 'package:space_app_2019/pages/networkChat/chatPage.dart';
import 'package:space_app_2019/pages/report/report_fire.dart';
import 'package:space_app_2019/pages/risk_zone/risk_zone_page.dart';
import 'package:space_app_2019/states/navigationState.dart';

List<Widget> _pages = [
  MapPage(),
  ChatPage(),
  RiskZonePage(),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Provider.of<NavigationState>(context).index == 0
          ? Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: FloatingActionButton.extended(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ReportFire())),
                label: Text(
                  'Report a fire',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Color.fromRGBO(252, 59, 28, 1),
                icon: Icon(Icons.error_outline),
              ),
            )
          : null,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _pages[Provider.of<NavigationState>(context).index],
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12.0),
              ),
              elevation: 12.0,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    PageWidget(
                      name: 'Home',
                      icon: Icons.map,
                      index: 0,
                    ),
                    PageWidget(
                      name: 'Emergency',
                      icon: Icons.chat,
                      index: 1,
                    ),
                    PageWidget(
                      name: 'Risk Zones',
                      icon: Icons.warning,
                      index: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
