import 'dart:convert';

import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/user.dart';
import 'package:fypp/app/utils/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController {
  Future<User> userSignIn(User user) async {
    Response response = await post(
      Api.BASE_URL + 'auth/cliente/login',
      headers: Api.BASE_HEADER,
      body: jsonEncode(
        user.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }

    Get.snackbar('Erro', 'Email ou senha inválidos');
    return null;
  }

  Future<Photographer> photographerSignIn(Photographer photographer) async {
    Response response = await post(
      Api.BASE_URL + 'auth/login',
      headers: Api.BASE_HEADER,
      body: jsonEncode(
        photographer.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return Photographer.fromJson(jsonDecode(response.body));
    }

    Get.snackbar('Erro', 'Email ou senha inválidos');
    return null;
  }

  Future<Photographer> getPhotographerByEmail(String email) async {
    Response response = await get(
      Api.BASE_URL + 'fotografos/email/$email',
      headers: Api.BASE_HEADER,
    );

    if (response.statusCode == 200) {
      return Photographer.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  Future<User> getUserByEmail(String email) async {
    Response response = await get(
      Api.BASE_URL + 'clientes/email/$email',
      headers: Api.BASE_HEADER,
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }

    return null;
  }
}
