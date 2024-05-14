import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final int bubblesCount;
  final Color backgroundColor;
  final double bubbleSize;
  final Color bubbleColor; // New parameter for bubble size

  const AnimatedBackground({
    Key? key,
    required this.child,
    required this.bubblesCount,
    required this.backgroundColor,
    required this.bubbleSize,
    required this.bubbleColor,
  }) : super(key: key);

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
      duration: const Duration(seconds: 10),
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
        borderColor: Colors.white, // Specify border color
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
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              bubble.position = Offset(
                bubble.position.dx,
                bubble.position.dy + (bubble.speed * _controller.value),
              );
              if (bubble.position.dy > MediaQuery.of(context).size.height +
                  bubble.radius * 2) {
                bubble.position = Offset(
                  Random().nextDouble() * MediaQuery.of(context).size.width,
                  -bubble.radius * 2,
                );
              }
              return Positioned(
                left: bubble.position.dx,
                top: bubble.position.dy,
                child: Container(
                  width: bubble.radius * 2,
                  height: bubble.radius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: bubble.borderColor, // Use border color
                      width: 2, // Adjust border width as needed
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ],
    );
  }
}

class Bubble {
  late Offset position;
  late double radius;
  late double speed;
  late Color borderColor; // Add a border color parameter

  Bubble({
    required this.position,
    required this.radius,
    required this.speed,
    required this.borderColor, // Initialize border color
  });
}
