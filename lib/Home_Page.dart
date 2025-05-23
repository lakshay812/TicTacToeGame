import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/game_page.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = GoogleFonts.abel(
      textStyle: const TextStyle(
        color: Colors.white,
        letterSpacing: 3,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen background image
          Positioned.fill(
            child: Image.asset(
              'assets/r.jpeg', // or use the newly uploaded image if renamed
              fit: BoxFit.cover,
            ),
          ),

          // Title at the top
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'TIC TAC TOE',
                  style: TextStyle(
                    fontFamily: 'MyFont',
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // "Play Game" Button positioned manually (adjust top & left values to center it)
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.39, // Adjust based on actual image layout
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(vertical:4),
              ),
              child: Text(
                '',
                style: GoogleFonts.abel(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
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
