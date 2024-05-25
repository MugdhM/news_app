import 'package:flutter/material.dart';
import 'articles/article_page.dart';
import 'game/jumping_game.dart';
import 'package:lottie/lottie.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interstellar Insider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArticlePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFF0d49b3), // Background color of the button
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Curved border radius
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie/news.json', // Path to your news animation
                      height: 160, // Increased height of the Lottie animation
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Read News',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white, // Text color for "View Articles"
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 130),
            SizedBox(
              width: 250,
              height: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JumpingGame()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xFF0d49b3), // Background color of the button
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Curved border radius
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie/game.json', // Path to your game animation
                      height: 170, // Increased height of the Lottie animation
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Play Game',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white, // Text color for "Play Game"
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
