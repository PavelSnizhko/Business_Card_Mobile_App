import 'package:business_card_project/addCard.dart';
import 'package:business_card_project/settings.dart';
import 'package:flutter/material.dart';

import 'package:business_card_project/home.dart';

import 'package:flutter/widgets.dart';

import 'QRScanner.dart';


void main() {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Card System',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,

        fontFamily: 'Georgia',

        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Business Card'),
        '/newcard': (context) => AddCard(),
        '/settings': (context) => Settings(),
        '/scanner': (context) => QRViewExample(),
      },
    );
  }
}