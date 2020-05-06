import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/models/auth-login.model.dart';
import 'package:shopping/models/auth-register.model.dart';
import 'package:shopping/models/user.model.dart';
import 'package:shopping/repositories/auth.repository.dart';
import 'package:shopping/settings.dart';

class UserBloc extends ChangeNotifier {
  var user = new UserModel();

  UserBloc() {
    user = null;
    load();
  }

  Future<UserModel> login(AuthLoginModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var repository = new AuthRepository();

      var res = await repository.login(model);

      user = res;
      await prefs.setString('user', jsonEncode(res));

      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  Future<UserModel> register(AuthRegisterModel model) async {
    try {
      var repository = new AuthRepository();
      var res = await repository.register(model);
      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var res = UserModel.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    notifyListeners();
  }
}
