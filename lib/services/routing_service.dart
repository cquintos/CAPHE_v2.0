import 'package:caphe_v2/shared/routing_constants.dart';
import 'package:caphe_v2/screens/about_screen/about_screen.dart';
import 'package:caphe_v2/screens/calendar_screen.dart';
import 'package:caphe_v2/screens/home_screen/home_screen.dart';
import 'package:caphe_v2/screens/login_screen/login_screen.dart';
import 'package:caphe_v2/screens/navigation_screen/navigation_screen.dart';
import 'package:caphe_v2/screens/register_screen/register_screen.dart';
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
    case RegisterScreenRoute:
      return MaterialPageRoute(builder: (context) => RegisterScreen());
    case CalendarScreenRoute:
      return MaterialPageRoute(builder: (context) => CalendarScreen());
    case TimelineScreenRoute:
      return MaterialPageRoute(builder: (context) => TimelineScreen());
    case AboutScreenRoute:
      return MaterialPageRoute(builder: (context) => AboutScreen());
    case NavigationScreenRoute:
      return MaterialPageRoute(builder: (context) => NavigationScreen(0, 0));
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}