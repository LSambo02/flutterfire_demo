import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_demo/helpers/constantes.dart';
import 'package:flutterfire_demo/screens/minions_screen.dart';
import 'package:flutterfire_demo/screens/phone_validation_screen.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FireHome(),
      routes: {
        phone_validation_screen: (_) => PhoneValidationScreen(),
        collection_screen: (_) => MinionsScreen()
      },
    );
  }
}
