import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'StartupScreen.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      initialRoute: '/', // Set the initial route to '/'
      routes: {
        '/': (context) => StartupScreen(),
        '/home': (context) => HomePage(),
      },
    );
  }
}