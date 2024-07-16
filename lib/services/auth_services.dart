import 'dart:convert';

import 'package:chatinganfe/model/register_model.dart';
import 'package:chatinganfe/model/user_models.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserModel> register(RegisterModel data) async {
    try {
      final res = await http.post(
        Uri.parse('http://172.17.2.76:8080/api/people/register'),
        body: data.toJson(),
      );

      print(res.body + 'ini response');
      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copywith(password: data.password);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUser() async {
    try {
      final res = await http
          .get(Uri.parse('http://172.17.2.76:8080/api/people/datapeople'));

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (user) => UserModel.fromJson(user),
          ),
        ).toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
  // Future<void> register(RegisterModel data) async {
  //   try {
  //     final res = await http.post(
  //       Uri.parse('127.0.0.1:8000/api/people/register'),
  //       body: data.toJson(),
  //     );

  //     // print('ini token: $token');
  //     if (res.statusCode != 200) {
  //       throw jsonDecode(res.body)['message'];
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
