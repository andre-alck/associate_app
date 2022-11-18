import 'dart:async';
import 'dart:developer';

import 'package:p_associate_app/user/services/associate_user_service.dart';

import '../repositories/amqp_messenger_repository.dart';

class MessageService {
  Future<void> send(
    String message,
  ) async {
    AmqpMessageRepository amqpMessageRepository = AmqpMessageRepository();
    AssociateUserService associateUserService = AssociateUserService();

    String user = await associateUserService.associateUser();

    log(
      'Chosen user: $user',
    );

    amqpMessageRepository.sendMessage(
      user,
      message,
    );
  }

  Future<String> receive(
    String user,
  ) async {
    AmqpMessageRepository amqpMessageRepository = AmqpMessageRepository();
    String message = await amqpMessageRepository.receiveMessage(
      user,
    );

    return message;
  }
}
