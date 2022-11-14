import 'package:p_associate_app/send/repository/message/amqp_message_repository.dart';
import 'package:p_associate_app/send/services/associate_user_service.dart';

class SendMessageService {
  Future<void> sendMessage(
    String message,
  ) async {
    AmqpMessageRepository amqpMessageRepository = AmqpMessageRepository();
    AssociateUserService associateUserService = AssociateUserService();

    String user = await associateUserService.associateUser();

    amqpMessageRepository.sendMessage(
      user,
      message,
    );
  }
}
