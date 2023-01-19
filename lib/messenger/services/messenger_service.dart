import 'dart:async';
import 'dart:developer';

import 'package:p_associate_app/messenger/repositories/amqp_messenger_repository.dart';
import 'package:p_associate_app/user/services/associate_user_service.dart';

class MessengerService {
  Future<String> send(String message) async {
    AmqpMessengerRepository amqpMessengerRepository = AmqpMessengerRepository();
    UserService associateUserService = UserService();

    String user = await associateUserService.associateUser();

    log('Chosen user: $user');

    amqpMessengerRepository.sendMessage(user, message);

    return user;
  }

  Future<String> receive(String user) async {
    AmqpMessengerRepository amqpMessageRepository = AmqpMessengerRepository();
    String message = await amqpMessageRepository.receiveMessage(user);

    return message;
  }
}
