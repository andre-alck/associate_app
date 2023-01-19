import 'package:flutter/material.dart';
import 'package:p_associate_app/home/widgets/actions_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home_page";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            leading: const Icon(Icons.menu),
            title: const Text('Menu '),
            actions: const <Widget>[Icon(Icons.more_vert)]),
        body: const ActionsWidget());
  }
}
