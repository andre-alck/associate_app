import 'package:flutter/material.dart';
import 'package:p_associate_app/wait/pages/wait_for_messages_page.dart';

import '../../home/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home_page",
      routes: {
        HomePage.routeName: (
          context,
        ) =>
            const HomePage(),
        WaitForMessagesPage.routeName: (
          context,
        ) =>
            const WaitForMessagesPage()
      },
    );
  }
}
