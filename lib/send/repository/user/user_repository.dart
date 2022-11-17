import 'package:http/http.dart';

abstract class UserRepository {
  Future<String> getLastUser();
  Future<Response> addUser(
    String user,
  );
}
