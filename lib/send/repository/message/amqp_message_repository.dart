import 'dart:async';

import 'package:dart_amqp/dart_amqp.dart';

import 'message_repository.dart';

class AmqpMessageRepository implements MessageRepository {
  @override
  Future<void> sendMessage(
    String user,
    String message,
  ) async {
    ConnectionSettings connectionSettings = ConnectionSettings(
      maxConnectionAttempts: 5,
      host: '10.0.2.2',
      port: 5672,
    );

    Client client = Client(
      settings: connectionSettings,
    );
    Channel channel = await client.channel();
    Exchange exchange = await channel.exchange(
      "logs",
      ExchangeType.DIRECT,
    );

    exchange.publish(
      message,
      user,
    );

    client.close();
  }
}
