abstract class MessengerRepository {
  Future<String> sendMessage(
    String user,
    String message,
  );

  Future<String> receiveMessage(
    String user,
  );
}
