import 'package:flutter/material.dart';
import 'package:migraene/bottom_menu.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:migraene/screens/lokalisation_screen.dart';
import 'package:migraene/screens/medication_screen.dart';
import 'package:migraene/screens/profile_screen.dart';
import 'package:migraene/screens/schmerz_screen.dart';
import 'package:migraene/screens/home_screen.dart';
import 'package:migraene/screens/plus_screen.dart';
import 'package:migraene/screens/starting_screen.dart';
import 'package:migraene/screens/symptoms_screen.dart';
import 'package:migraene/screens/trigger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('de', ''), // English, no country code
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: StartingScreen(),
    );
  }
}
