import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:p_associate_app/send/services/message_service.dart';
import 'package:p_associate_app/wait/pages/wait_for_messages_page.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final MessageService sendMessageService = MessageService();
    TextEditingController usernameController = TextEditingController();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              String message = lorem(
                words: 1,
              );
              sendMessageService.send(
                message,
              );
              log(
                'Sent message: $message',
              );
            },
            child: const Text(
              'Send message to user.',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (
                  BuildContext context,
                ) {
                  return AlertDialog(
                    title: const Text(
                      'Enter your username',
                    ),
                    content: const Text(
                      '[1...5] only!',
                    ),
                    actions: <Widget>[
                      TextFormField(
                        controller: usernameController,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                        ),
                        onPressed: () => Navigator.pushNamed(
                          context,
                          WaitForMessagesPage.routeName,
                          arguments: usernameController.text.trim(),
                        ),
                      ),
                    ],
                  );
                },
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
