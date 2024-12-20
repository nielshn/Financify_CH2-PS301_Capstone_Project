import 'dart:convert';

import 'package:financify_wallet/models/user_edit_form_model.dart';
import 'package:financify_wallet/models/user_model.dart';
import 'package:financify_wallet/services/auth_service.dart';
import 'package:financify_wallet/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.put(
        Uri.parse('$baseUrl/users'),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<List<UserModel>> getRecentUsers() async {
    try {
      final token = await AuthService().getToken();
      final res =
          await http.get(Uri.parse('$baseUrl/transfer_histories'), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        final responseData = jsonDecode(res.body);
        return List<UserModel>.from(
            responseData['data'].map((user) => UserModel.fromJson(user)));
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsersByUsername(String username) async {
    try {
      final token = await AuthService().getToken();
      final res =
          await http.get(Uri.parse('$baseUrl/users/$username'), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        final responseData = jsonDecode(res.body);
        return List<UserModel>.from(
          responseData.map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
