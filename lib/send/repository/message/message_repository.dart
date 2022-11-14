abstract class MessageRepository {
  Future<void> sendMessage(
    String user,
    String message,
  );
}
