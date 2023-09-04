import 'package:flutter/material.dart';

class BorderLetter extends StatelessWidget {
  final int index;
  const BorderLetter({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          '$index',
          style: TextStyle(
            fontSize: 100,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = Colors.white,
          ),
        ),
        Text(
          '$index',
          style: const TextStyle(
            fontSize: 100,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
