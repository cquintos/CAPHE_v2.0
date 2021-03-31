import 'package:caphe_v2/routing_constants.dart';
import 'package:caphe_v2/screens/calendar_screen.dart';
import 'package:caphe_v2/screens/home_screen.dart';
import 'package:caphe_v2/screens/login_screen.dart';
import 'package:caphe_v2/screens/timeline_screen.dart';
import 'package:caphe_v2/screens/tracker_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    case HomeScreenRoute: 
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case LoginScreenRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case TrackerScreenRoute:
      return MaterialPageRoute(builder: (context) => TrackerScreen());
    case CalendarScreenRoute:
      return MaterialPageRoute(builder: (context) => CalendarScreen());
    case TimelineScreenRoute:
      return MaterialPageRoute(builder: (context) => TimelineScreen());
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}