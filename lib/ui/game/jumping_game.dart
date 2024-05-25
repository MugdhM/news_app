import 'package:flutter/material.dart';

class JumpingGame extends StatefulWidget {
  @override
  _JumpingGameState createState() => _JumpingGameState();
}

class _JumpingGameState extends State<JumpingGame>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _jump() {
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Jumping Game')),
      body: Stack(
        children: [
          Positioned(
            top: screenSize.height / 2 - 100,
            left: screenSize.width / 2 - 150,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_animation.value),
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: _jump,
                child: Image.asset('assets/images/man.png',
                    width: 300, height: 200),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: _jump,
                child: Text('Jump', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
