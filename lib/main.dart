import 'package:flutter/material.dart';
import 'package:jogo_davelha/models/GameModel.dart';
import 'package:jogo_davelha/widgets/GameTile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da velha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Game(),
    );
  }
}


class Game extends StatefulWidget {
  const Game({super.key});

  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  GameModel gameModel = GameModel();

  void _handleTileTap(int index) {
    setState(() {
      gameModel.playMove(index);
    });
  }

Widget _buildGameBoard() {
  List<Widget> tiles = [];
  for (int i = 0; i < 9; i++) {
    tiles.add(GameTile(
      onTap: () => _handleTileTap(i),
      text: gameModel.board[i],
      key: ValueKey(i),
    ));
  }
  return GridView.count(
    crossAxisCount: 3,
    children: tiles,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
      ),
      body: Center(
        child: _buildGameBoard(),
      ),
    );
  }
}
