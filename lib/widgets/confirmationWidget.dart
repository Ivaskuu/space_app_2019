import 'dart:io';

import 'package:flutter/material.dart';

class ConfirmFireWidget extends StatelessWidget {
  File _image;
  ConfirmFireWidget(this._image);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Material(
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                      child: Image.file(
                    _image,
                    height: 150,
                    width: 266,
                    fit: BoxFit.fitWidth,
                  ))),
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Text('Safe zone'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('no'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
