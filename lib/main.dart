import 'package:flutter/material.dart';
import 'authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:caphe_v2/router.dart' as router;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:caphe_v2/screens/login_screen.dart';
import 'package:caphe_v2/screens/navigation_screen.dart';
// import 'package:caphe_v2/routing_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, 
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CAPHE v2',
        onGenerateRoute: router.generateRoute,
        theme: ThemeData(
          primaryColor: Colors.green.shade800,
          accentColor: Colors.white,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper ({ Key key }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null )
      print("there is user");
    return firebaseUser == null ? LoginScreen() : NavigationScreen();   
  }
}