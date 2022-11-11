import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:p_associate_app/wait/pages/wait_for_messages_page.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () => log(
              'Sent message.',
            ),
            child: const Text(
              'Send message to user.',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                WaitForMessagesPage.routeName,
              );
            },
            child: const Text(
              'Wait for messages.',
            ),
          )
        ],
      ),
    );
  }
}
