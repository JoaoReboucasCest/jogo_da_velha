class PlayerVsPlayerGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player vs Player'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/player-vs-bot');
            },
          ),
        ],
      ),
      body: Center(
        child: Game(),
      ),
    );
  }
}
