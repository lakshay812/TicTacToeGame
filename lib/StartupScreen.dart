import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

class StartupScreen extends StatelessWidget {
  static var myNewFontW = GoogleFonts.abel(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 30),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'TIC TAC TOE',
                style: myNewFontW,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset('lib/images/'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Play Game',
                  style: GoogleFonts.abel(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}