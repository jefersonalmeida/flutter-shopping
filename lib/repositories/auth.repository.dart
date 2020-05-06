import 'package:dio/dio.dart';
import 'package:shopping/models/auth-login.model.dart';
import 'package:shopping/models/auth-register.model.dart';
import 'package:shopping/models/user.model.dart';
import 'package:shopping/settings.dart';

class AuthRepository {
  Future<UserModel> login(AuthLoginModel model) async {
    var url = '${Settings.apiUrl}/v1/account/login';
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> register(AuthRegisterModel model) async {
    var url = '${Settings.apiUrl}/v1/account';
    Response response = await Dio().post(url, data: model);
    return UserModel.fromJson(response.data);
  }
}
