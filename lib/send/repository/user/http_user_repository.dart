import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'user_repository.dart';

class HttpUserRepository implements UserRepository {
  @override
  Future<String> getLastUser() async {
    Future<Response> futureResponse = http.get(
      Uri.parse(
        'http://localhost:8080/associate/last-user',
      ),
    );

    final response = await futureResponse;
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
        'Failed to get last user.',
      );
    }
  }
}
