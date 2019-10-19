import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_app_2019/pages/home/home_page.dart';
import 'package:space_app_2019/pages/report/report_fire.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceApp 2019',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
