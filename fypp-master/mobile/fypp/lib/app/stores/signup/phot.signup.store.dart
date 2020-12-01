import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fypp/app/controllers/address.controller.dart';
import 'package:fypp/app/controllers/signup_controller.dart';
import 'package:fypp/app/model/address.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/utils/api.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart';
import 'package:cep_future/cep_future.dart';
part 'phot.signup.store.g.dart';

class PhotSignUpStore = _PhotSignUpStoreBase with _$PhotSignUpStore;

abstract class _PhotSignUpStoreBase with Store {
  AddressController addressController = AddressController();
  SignUpController signUpController = SignUpController();

  @observable
  Photographer loggedPhot = Photographer();

  @observable
  Address photAddress = Address();

  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  @observable
  String name = '';

  @observable
  String cpf = '';

  @observable
  DateTime birthDate;

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
  String experience = '';

  @observable
  String phone = '';

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
  void setCpf(String value) => cpf = value;

  @action
  void setBirthDate(DateTime value) => birthDate = value;

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
  void setExperience(String value) => experience = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isNameValid => !isNumeric(name);

  @computed
  bool get isCpfValid => cpf.length > 13;

  @computed
  bool get isBirthDateValid => birthDate != null;

  @computed
  bool get isCepValid => cep.length > 8;

  @computed
  bool get isExperienceValid => !isNumeric(experience);

  @computed
  bool get isPhoneValid => phone.length > 9;

  @computed
  bool get isEmailValid => isEmail(email);

  @computed
  bool get isPasswordValid => password.length > 5;

  @computed
  Function get firstFormPressed => (isNameValid &&
          isCpfValid &&
          isBirthDateValid &&
          isCepValid &&
          isExperienceValid &&
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
  Future<Photographer> signUp() async {
    isLoading = true;
    Address address = Address(
        id: null,
        cep: cep,
        city: city.text,
        state: state.text,
        country: 'br',
        neigh: neigh.text,
        number: numberHouse,
        street: street.text);

    photAddress = await addressController.addAddress(address);

    if (photAddress != null) {
      Photographer phot = Photographer(
        id: null,
        name: name,
        cpf: cpf,
        birthDate: dateFormat.format(birthDate).toString(),
        cep: cep,
        address: {
          'id': photAddress.id
        },
        experience: 'Amador',
        phone: phone,
        email: email, 
        role: 'ADMIN',
        password: password,
      );

      loggedPhot = await signUpController.photographerSignUp(phot);

      if (loggedPhot != null) {
        await Future.delayed(Duration(seconds: 2));
        isLoading = false;
        isLoggedIn = true;
        return loggedPhot;
      }
    }

    return null;
  }
}
