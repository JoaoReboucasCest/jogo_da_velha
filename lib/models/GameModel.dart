import 'dart:math';

class GameModel {
  late List<String> board;
  late String currentPlayer;

  GameModel() {
    resetBoard();
  }

  void resetBoard() {
    board = List.filled(9, '');
    currentPlayer = 'X';
  }

  void playMove(int index) {
    if (board[index] == '') {
      board[index] = currentPlayer;
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    }
  }

  bool isGameOver() {
    if (_hasPlayerWon('X') || _hasPlayerWon('O') || board.every((element) => element != '')) {
      return true;
    } else {
      return false;
    }
  }

  bool _hasPlayerWon(String player) {
    if ((board[0] == player && board[1] == player && board[2] == player) ||
        (board[3] == player && board[4] == player && board[5] == player) ||
        (board[6] == player && board[7] == player && board[8] == player) ||
        (board[0] == player && board[3] == player && board[6] == player) ||
        (board[1] == player && board[4] == player && board[7] == player) ||
        (board[2] == player && board[5] == player && board[8] == player) ||
        (board[0] == player && board[4] == player && board[8] == player) ||
        (board[2] == player && board[4] == player && board[6] == player)) {
      return true;
    } else {
      return false;
    }
  }
}

class BotPlayer {
  final String symbol;

  BotPlayer(this.symbol);
}

class TicTacToe extends StatefulWidget {
  final BotPlayer? botPlayer;

  TicTacToe({this.botPlayer});

  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  GameModel gameModel = GameModel();

  void _handleTileTap(int index) {
    setState(() {
      gameModel.playMove(index);

      if (widget.botPlayer != null && !gameModel.isGameOver() && gameModel.currentPlayer == widget.botPlayer!.symbol) {
        makeBotMove();
      }
    });
  }

  void makeBotMove() {
    List<int> emptyTiles = [];

    for (int i = 0; i < 9; i++) {
      if (gameModel.board[i] == '') {
        emptyTiles.add(i);
      }
    }

    if (emptyTiles.isNotEmpty) {
      int randomIndex = Random().nextInt(emptyTiles.length);
      int tileIndex = emptyTiles[randomIndex]; 
      playMove(tileIndex);
    }
  }
}

class GameModel extends ChangeNotifier {
  late List<String> _board;
  late String _currentPlayer;
  late bool _gameOver;

  GameModel() {
    _board = List.filled(9, '');
    _currentPlayer = 'X';
    _gameOver = false;
  }

  List<String> get board => _board;

  String get currentPlayer => _currentPlayer;

  bool get gameOver => _gameOver;

  void playMove(int index) {
    if (!_gameOver && _board[index] == '') {
      _board[index] = _currentPlayer;
      _checkGameOver();
      _switchPlayer();
    }
  }

  void makeBotMove() {
    List<int> emptyTiles = [];
    for (int i = 0; i < _board.length; i++) {
      if (_board[i] == '') {
        emptyTiles.add(i);
      }
    }

    if (emptyTiles.isNotEmpty) {
      int randomIndex = Random().nextInt(emptyTiles.length);
      int tileIndex = emptyTiles[randomIndex];
      _board[tileIndex] = 'O';
      _checkGameOver();
      _switchPlayer();
    }
  }

  void _checkGameOver() {
    // Implement the game over logic here
  }

  void _switchPlayer() {
    _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
    notifyListeners();
  }
}
