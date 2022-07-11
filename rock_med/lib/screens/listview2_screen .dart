import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = ["game", "game2", "game 3", "megman"];
  Listview2Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("listview Tipo 1"),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
            trailing: const Icon(Icons.arrow_circle_right_outlined,
                color: Colors.indigo),
            title: Text(options[index]),
            onTap: () {}),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
