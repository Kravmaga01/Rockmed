import 'package:flutter/material.dart';
import 'package:rock_med/providers/db_provider.dart';
import 'package:rock_med/router/routersApp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Homeview"),
          ),
          elevation: 0,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(RouterApp.menuOption[index].name),
                  leading: Icon(RouterApp.menuOption[index].icon),
                  onTap: () => {
                    Navigator.pushNamed(
                        context, RouterApp.menuOption[index].route)
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: RouterApp.menuOption.length));
  }
}
