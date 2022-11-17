import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'user_repository.dart';

class HttpUserRepository implements UserRepository {
  @override
  Future<String> getLastUser() async {
    Future<Response> futureResponse = http.get(
      Uri.parse(
        'https://01d2-177-103-247-210.sa.ngrok.io/associate/last-user',
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

  @override
  Future<Response> addUser(
    String name,
  ) async {
    Future<Response> futureResponse = http.post(
      Uri.parse(
        'https://01d2-177-103-247-210.sa.ngrok.io/associate/',
      ),
      headers: <String, String>{
        "Content-Type": "application/json; charset=URF-8",
      },
      body: <String, String>{
        "name": name,
      },
    );

    final Response response = await futureResponse;
    if (response.statusCode == 200) {
      return futureResponse;
    } else {
      throw "Failed to save user.";
    }
  }
}
