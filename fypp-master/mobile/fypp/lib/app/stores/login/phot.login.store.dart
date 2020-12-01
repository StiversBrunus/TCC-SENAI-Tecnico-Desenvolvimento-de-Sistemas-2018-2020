import 'dart:convert';

import 'package:fypp/app/controllers/login_controller.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/utils/shared.prefs.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
part 'phot.login.store.g.dart';

class PhotLoginStore = _PhotLoginStoreBase with _$PhotLoginStore;

abstract class _PhotLoginStoreBase with Store {
  SharedPrefs prefs = SharedPrefs();

  LoginController loginController = LoginController();

  @observable
  Map<String, dynamic> loggedUser = {};

  @observable
  Photographer phot;

  @observable
  Photographer photLogged = Photographer();

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
    phot = Photographer(email: email, password: password);
    photLogged = await loginController.photographerSignIn(phot);

    if (photLogged != null) {
      print(photLogged.email);
      photLogged =
          await loginController.getPhotographerByEmail(photLogged.email);
      if (photLogged != null) {
        prefs.getAndSaveToken(photLogged.token);
        isLoading = false;
        isLoggedIn = true;
      }
    }else{
      isLoading = false;
    }
  }
}
