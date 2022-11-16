import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:p_associate_app/send/services/associate_user_service.dart';
import 'package:p_associate_app/send/services/send_message_service.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final sendMessageService = SendMessageService();
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
                  context,
                ) {
                  return AlertDialog(
                    actions: [
                      InputUsernameWidget(
                        usernameController: usernameController,
                      ),
                      TextButton(
                        onPressed: () {
                          // validate input
                        },
                        child: const Icon(
                          Icons.navigate_next,
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

class InputUsernameWidget extends StatefulWidget {
  const InputUsernameWidget({
    Key? key,
    required this.usernameController,
  }) : super(key: key);

  final TextEditingController usernameController;

  @override
  State<InputUsernameWidget> createState() => _InputUsernameWidgetState();
}

class _InputUsernameWidgetState extends State<InputUsernameWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
      key: _formKey,
      controller: widget.usernameController,
      validator: (
        value,
      ) {
        if (value == null ||
            value.isEmpty ||
            !AssociateUserService.userList.contains(
              value,
            )) {
          return 'Invalid username.';
        }

        return null;
      },
    );
  }
}
