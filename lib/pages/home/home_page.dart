import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app_2019/pages/home/pageWidget.dart';
import 'package:space_app_2019/pages/networkChat/chatPage.dart';
import 'package:space_app_2019/states/navigationState.dart';

List<Widget> _pages = [
  Center(
    child: Text('Home\nSk2u non fa il merge'),
  ),
  ChatPage(),
  Center(
    child: Text('Risk Zones'),
  )
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: _pages[Provider.of<NavigationState>(context).index],
          ),
          Material(
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
                    icon: Icons.home,
                    index: 0,
                  ),
                  PageWidget(
                    name: 'Emergency',
                    icon: Icons.date_range,
                    index: 1,
                  ),
                  PageWidget(
                    name: 'Risk Zones',
                    icon: Icons.room_service,
                    index: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
