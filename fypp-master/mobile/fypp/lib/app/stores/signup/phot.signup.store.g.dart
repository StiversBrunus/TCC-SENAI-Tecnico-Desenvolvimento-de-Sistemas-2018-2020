// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phot.signup.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotSignUpStore on _PhotSignUpStoreBase, Store {
  Computed<bool> _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_PhotSignUpStoreBase.isNameValid'))
          .value;
  Computed<bool> _$isCpfValidComputed;

  @override
  bool get isCpfValid =>
      (_$isCpfValidComputed ??= Computed<bool>(() => super.isCpfValid,
              name: '_PhotSignUpStoreBase.isCpfValid'))
          .value;
  Computed<bool> _$isBirthDateValidComputed;

  @override
  bool get isBirthDateValid => (_$isBirthDateValidComputed ??= Computed<bool>(
          () => super.isBirthDateValid,
          name: '_PhotSignUpStoreBase.isBirthDateValid'))
      .value;
  Computed<bool> _$isCepValidComputed;

  @override
  bool get isCepValid =>
      (_$isCepValidComputed ??= Computed<bool>(() => super.isCepValid,
              name: '_PhotSignUpStoreBase.isCepValid'))
          .value;
  Computed<bool> _$isExperienceValidComputed;

  @override
  bool get isExperienceValid => (_$isExperienceValidComputed ??= Computed<bool>(
          () => super.isExperienceValid,
          name: '_PhotSignUpStoreBase.isExperienceValid'))
      .value;
  Computed<bool> _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_PhotSignUpStoreBase.isPhoneValid'))
          .value;
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_PhotSignUpStoreBase.isEmailValid'))
          .value;
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_PhotSignUpStoreBase.isPasswordValid'))
          .value;
  Computed<Function> _$firstFormPressedComputed;

  @override
  Function get firstFormPressed => (_$firstFormPressedComputed ??=
          Computed<Function>(() => super.firstFormPressed,
              name: '_PhotSignUpStoreBase.firstFormPressed'))
      .value;

  final _$loggedPhotAtom = Atom(name: '_PhotSignUpStoreBase.loggedPhot');

  @override
  Photographer get loggedPhot {
    _$loggedPhotAtom.reportRead();
    return super.loggedPhot;
  }

  @override
  set loggedPhot(Photographer value) {
    _$loggedPhotAtom.reportWrite(value, super.loggedPhot, () {
      super.loggedPhot = value;
    });
  }

  final _$photAddressAtom = Atom(name: '_PhotSignUpStoreBase.photAddress');

  @override
  Address get photAddress {
    _$photAddressAtom.reportRead();
    return super.photAddress;
  }

  @override
  set photAddress(Address value) {
    _$photAddressAtom.reportWrite(value, super.photAddress, () {
      super.photAddress = value;
    });
  }

  final _$nameAtom = Atom(name: '_PhotSignUpStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$cpfAtom = Atom(name: '_PhotSignUpStoreBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$birthDateAtom = Atom(name: '_PhotSignUpStoreBase.birthDate');

  @override
  DateTime get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(DateTime value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  final _$cepAtom = Atom(name: '_PhotSignUpStoreBase.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$stateAtom = Atom(name: '_PhotSignUpStoreBase.state');

  @override
  TextEditingController get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(TextEditingController value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$streetAtom = Atom(name: '_PhotSignUpStoreBase.street');

  @override
  TextEditingController get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(TextEditingController value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  final _$countryAtom = Atom(name: '_PhotSignUpStoreBase.country');

  @override
  TextEditingController get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(TextEditingController value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$neighAtom = Atom(name: '_PhotSignUpStoreBase.neigh');

  @override
  TextEditingController get neigh {
    _$neighAtom.reportRead();
    return super.neigh;
  }

  @override
  set neigh(TextEditingController value) {
    _$neighAtom.reportWrite(value, super.neigh, () {
      super.neigh = value;
    });
  }

  final _$numberHouseAtom = Atom(name: '_PhotSignUpStoreBase.numberHouse');

  @override
  String get numberHouse {
    _$numberHouseAtom.reportRead();
    return super.numberHouse;
  }

  @override
  set numberHouse(String value) {
    _$numberHouseAtom.reportWrite(value, super.numberHouse, () {
      super.numberHouse = value;
    });
  }

  final _$cityAtom = Atom(name: '_PhotSignUpStoreBase.city');

  @override
  TextEditingController get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(TextEditingController value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$experienceAtom = Atom(name: '_PhotSignUpStoreBase.experience');

  @override
  String get experience {
    _$experienceAtom.reportRead();
    return super.experience;
  }

  @override
  set experience(String value) {
    _$experienceAtom.reportWrite(value, super.experience, () {
      super.experience = value;
    });
  }

  final _$phoneAtom = Atom(name: '_PhotSignUpStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$emailAtom = Atom(name: '_PhotSignUpStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_PhotSignUpStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PhotSignUpStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoggedInAtom = Atom(name: '_PhotSignUpStoreBase.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$setCepAsyncAction = AsyncAction('_PhotSignUpStoreBase.setCep');

  @override
  Future<void> setCep(String value) {
    return _$setCepAsyncAction.run(() => super.setCep(value));
  }

  final _$searchCepAsyncAction = AsyncAction('_PhotSignUpStoreBase.searchCep');

  @override
  Future<Map<String, dynamic>> searchCep(String cep) {
    return _$searchCepAsyncAction.run(() => super.searchCep(cep));
  }

  final _$signUpAsyncAction = AsyncAction('_PhotSignUpStoreBase.signUp');

  @override
  Future<Photographer> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_PhotSignUpStoreBaseActionController =
      ActionController(name: '_PhotSignUpStoreBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_PhotSignUpStoreBaseActionController.startAction(
        name: '_PhotSignUpStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_PhotSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_PhotSignUpStoreBaseActionController.startAction(
        name: '_PhotSignUpStoreBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_PhotSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDate(DateTime value) {
    final _$actionInfo = _$_PhotSignUpStoreBaseActionController.startAction(
        name: '_PhotSignUpStoreBase.setBirthDate');
    try {
      return super.setBirthDate(value);
    } finally {
      _$_PhotSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$_PhotSignUpStoreBaseActionController.startAction(
        name: '_PhotSignUpStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_PhotSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExperience(String value) {
    final _$actionInfo = _$_PhotSignUpStoreBaseActionController.startAction(
        name: '_PhotSignUpStoreBase.setExperience');
    try {
      return super.setExperience(value);
    } finally {
      _$_PhotSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_PhotSignUpStoreBaseActionController.startAction(
        name: '_PhotSignUpStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_PhotSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_PhotSignUpStoreBaseActionController.startAction(
        name: '_PhotSignUpStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_PhotSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_PhotSignUpStoreBaseActionController.startAction(
        name: '_PhotSignUpStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_PhotSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedPhot: ${loggedPhot},
photAddress: ${photAddress},
name: ${name},
cpf: ${cpf},
birthDate: ${birthDate},
cep: ${cep},
state: ${state},
street: ${street},
country: ${country},
neigh: ${neigh},
numberHouse: ${numberHouse},
city: ${city},
experience: ${experience},
phone: ${phone},
email: ${email},
password: ${password},
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
isNameValid: ${isNameValid},
isCpfValid: ${isCpfValid},
isBirthDateValid: ${isBirthDateValid},
isCepValid: ${isCepValid},
isExperienceValid: ${isExperienceValid},
isPhoneValid: ${isPhoneValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
firstFormPressed: ${firstFormPressed}
    ''';
  }
}
