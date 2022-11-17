import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:p_associate_app/send/services/send_message_service.dart';
import 'package:p_associate_app/wait/pages/wait_for_messages_page.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final SendMessageService sendMessageService = SendMessageService();
    TextEditingController usernameController = TextEditingController();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              sendMessageService.sendMessage(
                lorem(
                  words: 3,
                ),
              );
              log(
                'Sent message.',
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
                        validator: (
                          value,
                        ) =>
                            "TODO: implement validator.",
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
