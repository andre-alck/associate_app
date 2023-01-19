import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:p_associate_app/messenger/services/messenger_service.dart';
import 'package:p_associate_app/user/services/associate_user_service.dart';

class WaitForMessagesWidget extends StatefulWidget {
  final List<String> userAndMessage;

  const WaitForMessagesWidget({required this.userAndMessage, Key? key})
      : super(key: key);

  @override
  State<WaitForMessagesWidget> createState() => _WaitForMessagesWidgetState();
}

class _WaitForMessagesWidgetState extends State<WaitForMessagesWidget> {
  Timer? timer;

  MessengerService messageService = MessengerService();

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              _showDialog(
                  context, widget.userAndMessage[0], widget.userAndMessage[1]);
            }
          }

          return const Center(child: CircularProgressIndicator());
        },
        future: messageService.receive(widget.userAndMessage[0]));
  }
}

Future<void> _showDialog(
    BuildContext context, String user, String message) async {
  await Future.delayed(const Duration(seconds: 1));

  UserService userService = UserService();
  MessengerService messengerService = MessengerService();

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('New message, $user!'),
            content: const Text('Accept it?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    userService.addUser(user);
                    log('Accepted it.');

                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    log('Denialed it.');
                    userService.addUser(user);
                    messengerService.send(message);

                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ]);
      });
}
