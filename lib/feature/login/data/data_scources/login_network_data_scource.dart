import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_acrtect/config/failure/failure.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

abstract class LoginNetworkDataSource {
  Future<User> login({required String userName, required String password});
}

class LoginNetworkDataSourceImpl implements LoginNetworkDataSource {
  final http.Client client;
  LoginNetworkDataSourceImpl({required this.client});
  @override
  Future<User> login(
      {required String userName, required String password}) async {
    try {
      final http.Response response = await client.post(
          Uri(scheme: 'https', host: 'dummyjson.com', path: 'auth/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': userName,
            'password': password,
          }));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return User.fromJson(responseData);
      } else {
        throw const Failure.unAutherised();
      }
    } on TimeoutException {
      throw const Failure.timeOut();
    } on UnAutherised {
      throw const Failure.unAutherised();
    } on SocketException {
      throw const Failure.netWorkFailure();
    } catch (e) {
      throw const Failure.unAutherised();
    }
  }
}
