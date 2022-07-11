import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {
  final options = ["game", "game2", "game 3"];
  ListviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("listview Tipo 1"),
        ),
      ),
      body: ListView(children: <Widget>[
        ...options
            .map((game) => ListTile(
                  title: Text(game),
                  trailing: const Icon(Icons.arrow_right),
                ))
            .toList(),
      ]),
    );
  }
}
