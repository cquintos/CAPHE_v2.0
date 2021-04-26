import 'package:caphe_v2/screens/facts_screen.dart';
import 'package:caphe_v2/screens/widgets/header_bar.dart';
import 'package:caphe_v2/screens/widgets/navigation_addbatch.dart';
import 'package:flutter/material.dart';
import '../authentication_service.dart';
import 'calendar_screen.dart';
import 'feedback_screen.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';


class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  String headerTitle = "CAPHE V2";

  List<Widget> _widgetOptions = [HomeScreen(), CalendarScreen(), FactsScreen(), FeedbackScreen()];
  List<String> titles = ["CAPHE V2", "CALENDAR", "COFFEE FACTS", "FEEBACK"];

  void _onItemTap (int index) {
    setState(() {
      _selectedIndex = index;
      headerTitle = titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer (
        child: ListView(
          children: [
            IconButton(onPressed:() {
              context.read<AuthenticationService>().signOut();

            }, icon: Icon(Icons.logout))
          ],
        ),
      ),
      appBar: HeaderBar(text: Text(headerTitle)),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add), onPressed: () {
          return showDialog<String> (
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return NavigationAddBatch( title: "Add New Coffee Batch", );
            },
          );
        }
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.green,),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.green,),
            label: 'Coffee Facts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_comment_rounded, color: Colors.green,),
            label: 'Feedback',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        iconSize: 30,
        selectedItemColor: Colors.green,
      ),
    );
  }
}