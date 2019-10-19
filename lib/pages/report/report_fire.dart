import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportFire extends StatefulWidget {
  @override
  _ReportFireState createState() => _ReportFireState();
}

File _fireImage;
final fireIcon = const IconData(0xe900, fontFamily: 'Icons');
int _fireStatus = 0;
Color _coloreActiveButton = Color.fromRGBO(252, 59, 28, 1);

class _ReportFireState extends State<ReportFire> {
  void _getImage() async {
    var fireImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _fireImage = fireImage;
      if (_fireImage == null) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    _getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fireImage == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (_fireImage != null)
                      Material(
                        elevation: 8,
                        shadowColor: Colors.black,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                        clipBehavior: Clip.antiAlias,
                        child: Center(
                            child: Image.file(
                          _fireImage,
                          height: 350,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                      ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 36, bottom: 16, left: 16),
                          child: Text(
                            'Perceived risk',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          child: Material(
                            color: _fireStatus == 1
                                ? _coloreActiveButton
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            clipBehavior: Clip.antiAlias,
                            elevation: 6,
                            shadowColor: Colors.black45,
                            child: Container(
                              height: 120,
                              width: 90,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(fireIcon,
                                      size: 45,
                                      color: _fireStatus == 1
                                          ? Colors.white
                                          : Colors.deepOrange[200]),
                                  Text(
                                    'Low',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: _fireStatus == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (_fireStatus != 1)
                              setState(() {
                                _fireStatus = 1;
                              });
                          },
                        ),
                        InkWell(
                          child: Material(
                            color: _fireStatus == 2
                                ? _coloreActiveButton
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            clipBehavior: Clip.antiAlias,
                            elevation: 6,
                            shadowColor: Colors.black45,
                            child: Container(
                              height: 120,
                              width: 90,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(fireIcon,
                                      size: 45,
                                      color: _fireStatus == 2
                                          ? Colors.white
                                          : Colors.deepOrange[200]),
                                  Text(
                                    'Medium',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: _fireStatus == 2
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (_fireStatus != 2)
                              setState(() {
                                _fireStatus = 2;
                              });
                          },
                        ),
                        InkWell(
                          child: Material(
                            color: _fireStatus == 3
                                ? _coloreActiveButton
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            clipBehavior: Clip.antiAlias,
                            elevation: 6,
                            shadowColor: Colors.black45,
                            child: Container(
                              height: 120,
                              width: 90,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(fireIcon,
                                      size: 45,
                                      color: _fireStatus == 3
                                          ? Colors.white
                                          : Colors.deepOrange[200]),
                                  Text(
                                    'High',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: _fireStatus == 3
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (_fireStatus != 3)
                              setState(() {
                                _fireStatus = 3;
                              });
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: RaisedButton(
                              color: Color.fromRGBO(3, 59, 146, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              onPressed: _fireStatus != 0
                                  ? () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          child: AlertDialog(
                                            contentPadding: EdgeInsets.only(
                                                bottom: 0,
                                                top: 16,
                                                left: 16,
                                                right: 16),
                                            title: Text('Report sent'),
                                            content: Text(
                                              'Dial emergency number?',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text(
                                                  'no',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              FlatButton(
                                                child: Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color:
                                                          _coloreActiveButton,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                onPressed: () async {
                                                  if (await canLaunch(
                                                      'tel:112')) {
                                                    await launch('tel:112');
                                                  } else {
                                                    throw 'Could not launch';
                                                  }
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ));
                                    }
                                  : null,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Text(
                                  'Send report',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                      top: 32,
                    ),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white54,
                      elevation: 0,
                      foregroundColor: Colors.black,
                      child: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
