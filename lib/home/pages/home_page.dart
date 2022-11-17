import 'package:flutter/material.dart';

import '../widgets/actions_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home_page";

  const HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'HomePage',
        ),
      ),
      body: const ActionsWidget(),
    );
  }
}
