import 'package:flutter/material.dart';

class WaitForMessagesPage extends StatelessWidget {
  static const routeName = "/wait_for_messages_page";

  const WaitForMessagesPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'mock',
        ),
      ),
    );
  }
}
