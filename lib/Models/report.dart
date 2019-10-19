import 'package:flutter/material.dart';

class ReportedFire {
  String username;
  String location;
  String image;
  int grade;
  bool opened = false;

  ReportedFire({
    this.username,
    this.location,
    this.grade,
    this.image,
  });
}
