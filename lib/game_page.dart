import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true;
  List<String> displayExOh = List.filled(9, '');

  int oscore = 0;
  int xscore = 0;
  int filledBoxes = 0;

  static var myNewFontW = GoogleFonts.play(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 30),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset(
              'assets/2.png',
              fit: BoxFit.cover,
            ),
          ),

          // Main content
          Column(
            children: <Widget>[
              const SizedBox(height: 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Player O',
                          style: TextStyle(
                            fontFamily: 'MyFont',
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                        Text(oscore.toString(), style: myNewFontW),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Player X',
                          style: TextStyle(
                            fontFamily: 'MyFont',
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                        Text(xscore.toString(), style: myNewFontW),
                      ],
                    ),
                  ),
                ],
              ),

              // Game board
              Expanded(
                flex: 2,
                child: GridView.builder(
                  padding: const EdgeInsets.all(30),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => _tapped(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          displayExOh[index],
                          style: const TextStyle(
                            fontFamily: 'MyFont',
                            fontSize: 48,
                            color: Colors.white, // Changed for better visibility
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Footer
              Expanded(
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "Tic Tac Toe",
                        style: const TextStyle(
                          fontFamily: 'MyFont2',
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: Text(
                        "By Lakshay Srivastava",
                        style: TextStyle(
                          fontFamily: 'MyFont2',
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayExOh[index] == '') {
        displayExOh[index] = ohTurn ? 'O' : 'X';
        filledBoxes++;
        ohTurn = !ohTurn;
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var condition in winConditions) {
      String a = displayExOh[condition[0]];
      String b = displayExOh[condition[1]];
      String c = displayExOh[condition[2]];
      if (a == b && b == c && a != '') {
        _showDialogue(context, a);
        return;
      }
    }

    if (filledBoxes == 9) {
      _showDraw(context);
    }
  }

  void _showDialogue(BuildContext context, String winner) {
    setState(() {
      if (winner == 'O') {
        oscore++;
      } else {
        xscore++;
      }
    });

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$winner is the Winner'),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDraw(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Draw'),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      displayExOh = List.filled(9, '');
      filledBoxes = 0;
    });
  }
}