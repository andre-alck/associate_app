import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../send/repository/user/http_user_repository.dart';
import '../../send/services/message_service.dart';

class WaitForMessagesWidget extends StatefulWidget {
  final String user;

  const WaitForMessagesWidget({
    required this.user,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<WaitForMessagesWidget> createState() => _WaitForMessagesWidgetState();
}

class _WaitForMessagesWidgetState extends State<WaitForMessagesWidget> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(
        seconds: 30,
      ),
      (
        timer,
      ) {
        setState(
          () {},
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return FutureBuilder(
      builder: (
        context,
        snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          } else if (snapshot.hasData) {
            _showDialog(
              context,
              widget.user,
            );
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: MessageService().receive(
        widget.user,
      ),
    );
  }
}

Future<void> _showDialog(
  BuildContext context,
  String username,
) async {
  await Future.delayed(
    const Duration(
      seconds: 1,
    ),
  );
  showDialog(
    context: context,
    builder: (
      context,
    ) {
      return AlertDialog(
        title: Text(
          'New message, $username!',
        ),
        content: const Text(
          'Accept it?',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              HttpUserRepository().addUser(
                username,
              );
              log(
                'Accepted it.',
              );

              Navigator.of(
                context,
              ).pop();
            },
            child: const Text(
              'Yes',
            ),
          ),
          TextButton(
            onPressed: () {
              log(
                'Denialed it.',
              );

              Navigator.of(
                context,
              ).pop();
            },
            child: const Text(
              'No',
            ),
          ),
        ],
      );
    },
  );
}
