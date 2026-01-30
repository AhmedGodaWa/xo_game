import 'package:flutter/material.dart';
import '../models/game_board_args.dart';
import '../widgets/board_button.dart';
import '../widgets/play_score.dart';
import 'login_screen.dart';

class GameBoardScreen extends StatefulWidget {
  static const String routeName = '/game-board';

  const GameBoardScreen({super.key});

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  List<String> board = List.filled(9, '');
  int round = 1;
  int player1Score = 0;
  int player2Score = 0;
  bool isXStarting = true;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GameBoardArgs;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildScoreRow(args),
            _buildTurnText(args),
            const SizedBox(height: 12),
            _buildActionButtons(),
            Expanded(child: _buildGameGrid()),
          ],
        ),
      ),
    );
  }

  // ================= UI =================

  Widget _buildScoreRow(GameBoardArgs args) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PlayScore(title: '${args.player1Name} (X)', score: player1Score),
          PlayScore(title: '${args.player2Name} (O)', score: player2Score),
        ],
      ),
    );
  }

  Widget _buildTurnText(GameBoardArgs args) {
    return Text(
      round.isOdd
          ? 'Turn: ${args.player1Name} (X)'
          : 'Turn: ${args.player2Name} (O)',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: restartRound,
              child: const Text('Restart Round'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: resetGame,
              child: const Text('Reset Game'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameGrid() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.24,
        ),
        itemCount: 9,
        itemBuilder: (_, index) {
          return BoardButton(
            text: board[index],
            onPressed: () {
              if (board[index].isNotEmpty) return;

              setState(() {
                if (round.isOdd) {
                  board[index] = 'X';

                  if (checkWinner('X')) {
                    player1Score++;
                    clearBoard();
                    return;
                  }
                } else {
                  board[index] = 'O';

                  if (checkWinner('O')) {
                    player2Score++;
                    clearBoard();
                    return;
                  }
                }

                round++;

                if (round == 10) {
                  clearBoard();
                }
              });
            },
          );
        },
      ),
    );
  }

  // ================= Logic =================

  bool checkWinner(String symbol) {
    if (round < 5) return false;

    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }

    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }

    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }

    for (int i = 0; i <= 2; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }

    return false;
  }

  void clearBoard() {
    board = List.filled(9, '');
    isXStarting = !isXStarting;
    round = isXStarting ? 1 : 2;
  }

  void restartRound() {
    setState(() {
      board = List.filled(9, '');
    });
  }

  void resetGame() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  }
}
