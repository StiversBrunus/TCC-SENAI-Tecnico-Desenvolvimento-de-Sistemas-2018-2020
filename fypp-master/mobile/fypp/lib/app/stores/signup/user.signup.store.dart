import 'dart:convert';

import 'package:cep_future/cep_future.dart';
import 'package:flutter/material.dart';
import 'package:fypp/app/controllers/address.controller.dart';
import 'package:fypp/app/controllers/signup_controller.dart';
import 'package:fypp/app/model/address.dart';
import 'package:fypp/app/model/user.dart';
import 'package:fypp/app/utils/api.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart';
import 'package:validators/validators.dart';
part 'user.signup.store.g.dart';

class UserSignUpStore = _UserSignUpStoreBase with _$UserSignUpStore;

abstract class _UserSignUpStoreBase with Store {
  AddressController addressController = AddressController();
  SignUpController signUpController = SignUpController();

  @observable
  Address userAddress = Address();

  @observable
  User loggedUser = User();

  @observable
  String name = '';

  @observable
  String phone = '';

  @observable
  String cep = '';

  @observable
  TextEditingController state = TextEditingController();

  @observable
  TextEditingController street = TextEditingController();

  @observable
  TextEditingController country = TextEditingController();

  @observable
  TextEditingController neigh = TextEditingController();

  @observable
  String numberHouse = '';

  @observable
  TextEditingController city = TextEditingController();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @action
  void setName(String value) => name = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  Future<void> setCep(String value) async {
    cep = value;
    if (cep.length > 8) {
      Map<String, dynamic> cepDetails = await searchCep(cep);
      if (cepDetails != null) {
        street.text = cepDetails['street'];
        city.text = cepDetails['city'];
        state.text = cepDetails['state'];
        neigh.text = cepDetails['neighborhood'];
      } else {
        Get.snackbar('Erro', 'Cep inválido');
      }
    }
  }

  @action
  void setNumber(String value) => numberHouse = value; 

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isNameValid => !isNumeric(name);

  @computed
  bool get isPhoneValid => phone.length > 9;

  @computed
  bool get isCepValid => cep.length > 8;

  @computed
  bool get isEmailValid => isEmail(email);

  @computed
  bool get isPasswordValid => password.length > 5;

  @computed
  Function get firstFormPressed => (isNameValid &&
          isCepValid &&
          isPhoneValid &&
          isEmailValid &&
          isPasswordValid &&
          !isLoading)
      ? signUp
      : null;

  @action
  Future<Map<String, dynamic>> searchCep(String cep) async {
    final result = await cepFuture(cep);
    Map<String, dynamic> cepDetails = {
      'cep': result.cep,
      'state': result.state,
      'city': result.city,
      'street': result.street,
      'neighborhood': result.neighborhood
    };
    return cepDetails;
  }

  @action
  Future<User> signUp() async {
    isLoading = true;
    Address address = Address(
      id: null,
      cep: cep,
      city: city.text,
      state: state.text,
      country: 'br',
      neigh: neigh.text,
      number: numberHouse,
      street: street.text,
    );

    userAddress = await addressController.addAddress(address);

    if (userAddress != null) {
      User user = User(
        id: null,
        name: name,
        cep: cep,
        address: {
          'id': userAddress.id
        },
        phone: phone,
        role: 'ADMIN',
        email: email,
        password: password,
      );

      loggedUser = await signUpController.userSignUp(user);

      if(loggedUser != null){
        await Future.delayed(Duration(seconds: 2));
        isLoading = false;
        isLoggedIn = true;
        return loggedUser;
      }
      return null;
    }

  }
}
