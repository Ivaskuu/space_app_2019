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
          Material(
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias ,
            child: Container(
              height: 200,
              child: Column(
                children: <Widget>[Image.file(_image,height: 150,width: 266,fit: BoxFit.fitWidth,)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
