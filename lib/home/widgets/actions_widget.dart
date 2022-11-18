import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:p_associate_app/messenger/services/messenger_service.dart';
import 'package:p_associate_app/wait/pages/wait_for_messages_page.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final MessengerService messengerService = MessengerService();

    final List<String> usernames = [
      "André",
      "Jackeline",
      "Julia",
      "Kaue",
      "Vinicius",
    ];
    String username = "";

    String message = lorem(
      words: 1,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () async {
              String user = await messengerService.send(
                message,
              );

              Future.delayed(
                Duration.zero,
                () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Sent message to $user',
                    ),
                  ),
                ),
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
                      'Select your username',
                    ),
                    actions: <Widget>[
                      DropdownButtonFormField(
                        icon: const Icon(
                          Icons.person,
                        ),
                        value: (username.isEmpty) ? null : username,
                        onChanged: (
                          userChoice,
                        ) =>
                            username = userChoice.toString(),
                        items: usernames
                            .map(
                              (
                                name,
                              ) =>
                                  DropdownMenuItem(
                                value: name,
                                child: Text(
                                  name,
                                ),
                              ),
                            )
                            .toList(),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                        ),
                        onPressed: () => Navigator.pushNamed(
                          context,
                          WaitForMessagesPage.routeName,
                          arguments: [
                            username,
                            message,
                          ],
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
