import 'dart:convert';

import 'package:fypp/app/controllers/login_controller.dart';
import 'package:fypp/app/model/user.dart';
import 'package:fypp/app/utils/api.dart';
import 'package:fypp/app/utils/shared.prefs.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart';
import 'package:validators/validators.dart';
part 'user.login.store.g.dart';

class UserLoginStore = _UserLoginStoreBase with _$UserLoginStore;

abstract class _UserLoginStoreBase with Store {
  SharedPrefs prefs = SharedPrefs();

  LoginController loginController = LoginController();

  @observable
  Map<String, dynamic> loggedUser = {};

  @observable
  User user;

  @observable
  User userLogged = User();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool visibility = false;

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => visibility = !visibility;

  @computed
  bool get isEmailValid => isEmail(email);

  @computed
  bool get isPasswordValid => password.length > 5;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !isLoading) ? login : null;

  @action
  Future<void> login() async {
    isLoading = true;
    user = User(email: email, password: password);
    userLogged = await loginController.userSignIn(user); 

    if (userLogged != null) {
      userLogged = await loginController.getUserByEmail(userLogged.email);
      if (userLogged != null) {
        prefs.getAndSaveToken(userLogged.token);
        isLoading = false;
        isLoggedIn = true;
      }
    }else{
      isLoading = false;
    }
  }
}
