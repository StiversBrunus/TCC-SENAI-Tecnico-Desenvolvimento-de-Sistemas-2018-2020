// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.signup.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserSignUpStore on _UserSignUpStoreBase, Store {
  Computed<bool> _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_UserSignUpStoreBase.isNameValid'))
          .value;
  Computed<bool> _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_UserSignUpStoreBase.isPhoneValid'))
          .value;
  Computed<bool> _$isCepValidComputed;

  @override
  bool get isCepValid =>
      (_$isCepValidComputed ??= Computed<bool>(() => super.isCepValid,
              name: '_UserSignUpStoreBase.isCepValid'))
          .value;
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_UserSignUpStoreBase.isEmailValid'))
          .value;
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_UserSignUpStoreBase.isPasswordValid'))
          .value;
  Computed<Function> _$firstFormPressedComputed;

  @override
  Function get firstFormPressed => (_$firstFormPressedComputed ??=
          Computed<Function>(() => super.firstFormPressed,
              name: '_UserSignUpStoreBase.firstFormPressed'))
      .value;

  final _$userAddressAtom = Atom(name: '_UserSignUpStoreBase.userAddress');

  @override
  Address get userAddress {
    _$userAddressAtom.reportRead();
    return super.userAddress;
  }

  @override
  set userAddress(Address value) {
    _$userAddressAtom.reportWrite(value, super.userAddress, () {
      super.userAddress = value;
    });
  }

  final _$loggedUserAtom = Atom(name: '_UserSignUpStoreBase.loggedUser');

  @override
  User get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(User value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  final _$nameAtom = Atom(name: '_UserSignUpStoreBase.name');

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

  final _$phoneAtom = Atom(name: '_UserSignUpStoreBase.phone');

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

  final _$cepAtom = Atom(name: '_UserSignUpStoreBase.cep');

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

  final _$stateAtom = Atom(name: '_UserSignUpStoreBase.state');

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

  final _$streetAtom = Atom(name: '_UserSignUpStoreBase.street');

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

  final _$countryAtom = Atom(name: '_UserSignUpStoreBase.country');

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

  final _$neighAtom = Atom(name: '_UserSignUpStoreBase.neigh');

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

  final _$numberHouseAtom = Atom(name: '_UserSignUpStoreBase.numberHouse');

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

  final _$cityAtom = Atom(name: '_UserSignUpStoreBase.city');

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

  final _$emailAtom = Atom(name: '_UserSignUpStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_UserSignUpStoreBase.password');

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

  final _$isLoadingAtom = Atom(name: '_UserSignUpStoreBase.isLoading');

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

  final _$isLoggedInAtom = Atom(name: '_UserSignUpStoreBase.isLoggedIn');

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

  final _$setCepAsyncAction = AsyncAction('_UserSignUpStoreBase.setCep');

  @override
  Future<void> setCep(String value) {
    return _$setCepAsyncAction.run(() => super.setCep(value));
  }

  final _$searchCepAsyncAction = AsyncAction('_UserSignUpStoreBase.searchCep');

  @override
  Future<Map<String, dynamic>> searchCep(String cep) {
    return _$searchCepAsyncAction.run(() => super.searchCep(cep));
  }

  final _$signUpAsyncAction = AsyncAction('_UserSignUpStoreBase.signUp');

  @override
  Future<User> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_UserSignUpStoreBaseActionController =
      ActionController(name: '_UserSignUpStoreBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_UserSignUpStoreBaseActionController.startAction(
        name: '_UserSignUpStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_UserSignUpStoreBaseActionController.startAction(
        name: '_UserSignUpStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_UserSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$_UserSignUpStoreBaseActionController.startAction(
        name: '_UserSignUpStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_UserSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_UserSignUpStoreBaseActionController.startAction(
        name: '_UserSignUpStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_UserSignUpStoreBaseActionController.startAction(
        name: '_UserSignUpStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_UserSignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userAddress: ${userAddress},
loggedUser: ${loggedUser},
name: ${name},
phone: ${phone},
cep: ${cep},
state: ${state},
street: ${street},
country: ${country},
neigh: ${neigh},
numberHouse: ${numberHouse},
city: ${city},
email: ${email},
password: ${password},
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
isNameValid: ${isNameValid},
isPhoneValid: ${isPhoneValid},
isCepValid: ${isCepValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
firstFormPressed: ${firstFormPressed}
    ''';
  }
}
