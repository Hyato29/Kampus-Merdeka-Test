import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:km_test/data/models/user_model.dart';

class ApiService {
  Future<UserModel> fetchUsers(int page) async {
    try {
      final response = await http.get(
        Uri.parse("https://reqres.in/api/users?page=$page"),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromJson(data);
      } else {
        throw 'Responses are not success';
      }
    } catch (e) {
      throw 'Failed to load list of Users';
    }
  }
}
