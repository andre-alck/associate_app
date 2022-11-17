import 'package:flutter/material.dart';
import 'package:p_associate_app/home/pages/home_page.dart';

class WaitForMessagesPage extends StatelessWidget {
  static const routeName = "/wait_for_messages_page";

  const WaitForMessagesPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final String username = ModalRoute.of(
      context,
    )?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushNamed(
            context,
            HomePage.routeName,
          ),
        ),
      ),
      body: Center(
        child: Text(
          username,
        ),
      ),
    );
  }
}
