import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:p_associate_app/user/repositories/user_repository.dart';

class HttpUserRepository implements UserRepository {
  @override
  Future<String> getLastUser() async {
    Future<Response> futureResponse = http
        .get(Uri.parse('a15c-179-93-248-65.sa.ngrok.io/associate/last-user'));

    final response = await futureResponse;
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get last user.');
    }
  }

  @override
  Future<Response> addUser(
    String user,
  ) async {
    Future<Response> futureResponse = http.post(
        Uri.parse('a15c-179-93-248-65.sa.ngrok.io/associate/'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode({"name": user}));

    final Response response = await futureResponse;
    if (response.statusCode == 201) {
      return futureResponse;
    } else {
      throw "Failed to save user.";
    }
  }
}
