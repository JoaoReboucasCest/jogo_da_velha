class PlayerVsBotGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player vs Bot'),
        actions: [
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/player-vs-player');
            },
          ),
        ],
      ),
      body: Center(
        child: PlayerVsBotGame(),
      ),
    );
  }
}

class StatelessWidget {
}
