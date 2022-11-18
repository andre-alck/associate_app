abstract class MessageRepository {
  Future<void> sendMessage(
    String user,
    String message,
  );

  Future<String> receiveMessage(
    String user,
  );
}
