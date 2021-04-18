import 'package:flutter/material.dart';
import 'package:caphe_v2/router.dart' as router;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:caphe_v2/screens/login_screen.dart';
import 'package:caphe_v2/screens/navigation_screen.dart';
import 'package:caphe_v2/routing_constants.dart';
import 'package:caphe_v2/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) 
          return Center( child: Text('Error with Firebase down low'), );
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CAPHE v2',
            onGenerateRoute: router.generateRoute,
            theme: ThemeData(
              primaryColor: Colors.green.shade800,
              accentColor: Colors.white,
            ),
            // initialRoute: LoginScreenRoute,
            // initialRoute: HomeScreenRoute,
            home: InitializerWidget(),
            // initialRoute: RegisterScreenRoute,
            // initialRoute: NavigationScreenRoute,
          );
        }
        return Center( child: CircularProgressIndicator(backgroundColor: Colors.red,) );
      }
    );
  }
}

class InitializerWidget extends StatefulWidget {

  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth _auth;
  User _user;
  bool isLoading = true;

  @override
  void initState() { 

    super.initState();
    _auth = FirebaseAuth.instance;
    
    FirebaseAuth.instance
      .authStateChanges()
      .listen((User user) {
        if (user != null) {
          print(user.uid);
          print(user.phoneNumber);
        }
      });
    _user = _auth.currentUser;
    isLoading = false;
  }
  
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(
      body: Center( child: CircularProgressIndicator(), ),
    ) : _user == null ? LoginScreen() 
      : _user != null ? NavigationScreen() 
      : Scaffold(body: Center(child: Text(_user.phoneNumber),)); 
  }
}