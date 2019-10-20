import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifyState with ChangeNotifier {
  String uuid;
  SharedPreferences _prefs;
  void getUUID() async {
    Firestore _store = Firestore();
    _prefs = await SharedPreferences.getInstance();
    DocumentSnapshot snap =
        await _store.collection('Users').document('spaceApp').get();
    if (_prefs.containsKey('uuid')) {
      uuid = _prefs.getString('uuid');
    } else {
      uuid = Random().nextInt(4294967295).toString();
      _prefs.setString('uuid', uuid);
    }
    if (snap.data['uuid'] == null) {
      _store.document(snap.reference.path).setData({'uuid': uuid});
    }
  }
}
