import 'package:dogbin_mobile/api/dogbin_api.dart';
import 'package:dogbin_mobile/models/user.dart';
import 'package:dogbin_mobile/service_locator.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@singleton
class DogbinLogin {
  DogbinLogin() {
    api = locator.get<DogbinApi>(param1: Dio());
  }

  DogbinApi api;

  String errorMessage = '';

  Future<User> login(String userName, String password) async {
    try {
      User user = await api.logIn(
        userName,
        password,
        [
          'create',
          'update',
          'delete',
          'list'
        ], //list of permissions to handle the documents
        'Android App',
      );

      return user;
    } catch (e) {
      //errorMessage = e.message;
      print(e);
    }

    return null;
  }

  Future<bool> logout(String key) async {
    if (key != null || key.isNotEmpty) {
      try {
        await api.logOut(key);

        return true;
      } catch (e) {
        //errorMessage = e.message;
        print(e);
      }
    }
    return false;
  }
}
