import 'dart:async';
import 'dart:io';

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
      "direct_logs",
      ExchangeType.DIRECT,
    );

    exchange.publish(
      message,
      user,
    );

    client.close();
  }

  @override
  Future<String> receiveMessage(
    String user,
  ) async {
    ConnectionSettings connectionSettings = ConnectionSettings(
      maxConnectionAttempts: 5,
      host: '10.0.2.2',
      port: 5672,
    );
    Client client = Client(
      settings: connectionSettings,
    );
    ProcessSignal.sigint.watch().listen(
      (
        event,
      ) async {
        await client.close();
        exit(
          0,
        );
      },
    );

    List<String> routingKeys = [];
    routingKeys.add(
      user,
    );

    final Completer<String> completer = Completer<String>();

    client.channel().then(
      (
        Channel channel,
      ) {
        return channel.exchange(
          "direct_logs",
          ExchangeType.DIRECT,
          durable: false,
        );
      },
    ).then(
      (
        Exchange exchange,
      ) {
        return exchange.bindPrivateQueueConsumer(
          routingKeys,
          consumerTag: "direct_logs",
          noAck: true,
        );
      },
    ).then(
      (
        Consumer consumer,
      ) {
        consumer.listen(
          (
            AmqpMessage message,
          ) =>
              completer.complete(
            message.payloadAsString,
          ),
        );
      },
    );

    return completer.future;
  }
}
