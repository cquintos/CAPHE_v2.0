import 'package:flutter/material.dart';

class Event {
  bool hasPic = false;
  String date;
  String name;
  IconData icon;
  String tip;
  String type = "";
  Color color;

  Event( this.hasPic, this.date, this.name, this.color, this.icon, this.tip);
  Event.major( this.date, this.name, this.color, this.type, this.tip);

}