import 'package:flutter/material.dart';
import 'package:xo_game/screens/game_board_screen.dart';
import 'package:xo_game/screens/login_screen.dart';

void main() {
  runApp(const XoGame());
}

class XoGame extends StatelessWidget {
  const XoGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        GameBoardScreen.routeName: (_) => const GameBoardScreen(),
      },
    );
  }
}
