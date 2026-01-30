import 'package:flutter/material.dart';
import 'package:xo_game/screens/game_board_screen.dart';
import '../models/game_board_args.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController player1NameController = TextEditingController();
  final TextEditingController player2NameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XO Game'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: player1NameController,
              decoration: InputDecoration(
                labelText: 'Player 1 name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: player2NameController,
              decoration: InputDecoration(
                labelText: 'Player 2 name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    if (player1NameController.text.isEmpty ||
        player2NameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter both names')));
      return;
    }

    Navigator.pushNamed(
      context,
      GameBoardScreen.routeName,
      arguments: GameBoardArgs(
        player1Name: player1NameController.text,
        player2Name: player2NameController.text,
      ),
    );
  }
}
