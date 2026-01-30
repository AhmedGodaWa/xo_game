import 'package:flutter/material.dart';

class PlayScore extends StatelessWidget {
  final String title;
  final int score;

  const PlayScore({
    super.key,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 18)),
        Text(
          '$score',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
