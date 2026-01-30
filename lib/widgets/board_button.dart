import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const BoardButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
