import 'package:caphe_v2/services/authentication_wrapper.dart';
import 'package:caphe_v2/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'models/city.dart';
import 'services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:caphe_v2/services/routing_service.dart' as router;
import 'package:firebase_core/firebase_core.dart';

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
          create: (_) => AuthenticationService(),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, 
          initialData: null,
        ),
        StreamProvider<List<City>>.value(
          value: WeatherService().weatherData, 
          initialData: null
        )
      ],
      child: MaterialApp(
        title: 'CAPHE v2',
        home: AuthenticationWrapper(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        theme: ThemeData(
          primaryColor: Colors.green.shade800,
          accentColor: Colors.white,
        ),
      ),
    );
  }
}
