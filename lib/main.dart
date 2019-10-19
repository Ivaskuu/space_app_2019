import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app_2019/pages/loginPage/loginpage.dart';
import 'package:space_app_2019/states/NotifyState.dart';

void main() => runApp(
      ChangeNotifierProvider(
        builder: (context) => NotifyState()..getUUID(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  @override
  Widget build(BuildContext context) {
    _fcm.configure(onMessage: (Map<String, dynamic> message) async {
      print('onResume: $message');
    }, onResume: (Map<String, dynamic> message) async {
      print('onResume: $message');
    }, onLaunch: (Map<String, dynamic> message) async {
      print('onLaunch: $message');
    });
    return MaterialApp(
      title: 'SpaceApp 2019',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
