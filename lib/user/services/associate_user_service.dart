import 'dart:math';

import '../repositories/http_user_repository.dart';

class UserService {
  static final List<String> userList = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  HttpUserRepository httpUserRepository = HttpUserRepository();

  Future<String> associateUser() async {
    final lastUser = await httpUserRepository.getLastUser();
    String user = "";

    if (lastUser == "") {
      user = userList[Random().nextInt(
        userList.length - 1,
      )];
    } else {
      if (lastUser == userList[userList.length - 1]) {
        user = userList[0];
      } else {
        for (int i = 0; i < userList.length; i++) {
          if (lastUser == userList[i]) {
            user = userList[i + 1];
          }
        }
      }
    }

    return user;
  }

  Future<void> addUser(
    String user,
  ) async {
    httpUserRepository.addUser(
      user,
    );
  }
}
