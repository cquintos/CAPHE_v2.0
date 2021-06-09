import 'package:caphe_v2/models/city.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/models/farmer.dart';
import 'package:caphe_v2/screens/about_screen/about_screen.dart';
import 'package:caphe_v2/screens/facts_screen.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/add_farm_panel.dart';
import 'package:caphe_v2/screens/home_screen/slide_builder.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:caphe_v2/shared/header_bar.dart';
import 'package:caphe_v2/services/database_service.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/authentication_service.dart';
import '../feedback_screen.dart';
import '../home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen(this.startIndex, this.cardIndex, {Key key}) : super(key: key);
  final int startIndex;
  final int cardIndex;
  @override
  _NavigationScreenState createState() => _NavigationScreenState(this.startIndex, this.cardIndex);
}

class _NavigationScreenState extends State<NavigationScreen> {
  _NavigationScreenState(this.startIndex, this.cardIndex);
  final int startIndex;
  int cardIndex;

  final AuthenticationService _auth = AuthenticationService();
  final _user = FirebaseAuth.instance.currentUser;
  int _selectedIndex;
  String headerTitle = "CAPHE V2";
  List<Widget> _widgetOptions = List.empty(growable:true);
  bool isLoading = false;


  void _onItemTap (int index) {
    setState(() {
      _selectedIndex = index;
      cardIndex = 0;
      headerTitle = NAV_TITLES[index];
    });
  }

  _calculateFarms(List<City> cities, List<Farm> farms) {
    farms.forEach((farm) { 
      cities.forEach((city) {
        if(farm.location == city.name) {
          farm.calculate(city);
        }
      });
    });
  }

  @override
  void initState() { 
    super.initState();
    _selectedIndex = startIndex;
  }

  @override
  Widget build(BuildContext context) {
    _widgetOptions = [HomeScreen(), SlideBuilder(this.cardIndex), FactsScreen(), FeedbackScreen()];

    return MultiProvider(
      providers: [
        Provider<DatabaseService>(
          create: (_) => DatabaseService(),
        ),
        StreamProvider<List<Farm>>.value(
          value: DatabaseService().farms,
          initialData: null, 
        ),
        StreamProvider<Farmer>.value(
          value: DatabaseService().farmer,
          initialData: null, 
        ),
      ], 
      builder: (context, child) {
      final farmer = Provider.of<Farmer>(context);
      final cities = Provider.of<List<City>>(context);
      final farms = Provider.of<List<Farm>>(context);

     if(farms != null && cities != null) 
      _calculateFarms(cities, farms);

      return farmer == null || cities == null || farms == null ? Loading()
        : Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(farmer.nickname), 
                  accountEmail: Text(_user.email)
                ),
                ListTile(
                  title: Text("Edit information"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  title: Text("Announcements"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.info_rounded),
                  title: Text("FAQ"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  onTap: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
          ),
          appBar: HeaderBar(text: Text(headerTitle)),
          body: isLoading ? Loading() : _widgetOptions.elementAt(_selectedIndex),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green.shade800,
            foregroundColor: Colors.white,
            child: Icon(Icons.add), 
            onPressed: () async {
              setState(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MultiProvider(
                      providers: [
                        StreamProvider<List<Farm>>.value(
                          value: DatabaseService().farms,
                          initialData: null, 
                        ),
                      ],
                      builder: (context, child) => AddFarmPanel()
                    ),
                  )
                );
                isLoading = true;
              });
              await Future.delayed(Duration(seconds: 1)).then((_) {
                setState(() {
                  isLoading = false; 
                });
              });
            }
          ),
          bottomNavigationBar:BottomNavigationBar(
            items: const <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.green,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.agriculture_rounded, color: Colors.green,),
                label: 'Farms',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.calendar_today, color: Colors.green,),
              //   label: 'Calendar',
              // ),
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
    );
  }
}