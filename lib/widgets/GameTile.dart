import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const GameTile({required Key key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
