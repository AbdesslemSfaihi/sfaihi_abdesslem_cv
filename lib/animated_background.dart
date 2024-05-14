import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final int bubblesCount;
  final Color backgroundColor;
  final double bubbleSize;
  final Color bubbleColor; // New parameter for bubble size

  AnimatedBackground({
    required this.child,
    required this.bubblesCount,
    required this.backgroundColor,
    required this.bubbleSize,
    required this.bubbleColor,
  });

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Bubble> _bubbles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bubbles = List.generate(
      widget.bubblesCount,
          (index) => Bubble(
        position: Offset(
          Random().nextDouble() * MediaQuery.of(context).size.width,
          Random().nextDouble() * MediaQuery.of(context).size.height,
        ),
            radius: widget.bubbleSize, // Set the bubble size
            speed: Random().nextDouble() * 50 + 20,
      ),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: widget.backgroundColor,
          child: widget.child,
        ),
        ..._bubbles.map((bubble) {
          return Positioned(
            left: bubble.position.dx,
            top: bubble.position.dy,
            child: Container(
              width: bubble.radius * 2,
              height: bubble.radius * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}


class Bubble {
  Offset position;
  double radius;
  double speed;

  Bubble({
    required this.position,
    required this.radius,
    required this.speed,
  });
}
