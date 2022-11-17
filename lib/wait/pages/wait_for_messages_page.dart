import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_associate_app/home/pages/home_page.dart';
import 'package:p_associate_app/send/services/message_service.dart';

class WaitForMessagesPage extends StatefulWidget {
  static const routeName = "/wait_for_messages_page";

  const WaitForMessagesPage({
    super.key,
  });

  @override
  State<WaitForMessagesPage> createState() => _WaitForMessagesPageState();
}

class _WaitForMessagesPageState extends State<WaitForMessagesPage> {
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
      body: FutureBuilder(
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  snapshot.data as String,
                ),
              );
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: MessageService().receive(
          username,
        ),
      ),
    );
  }
}
