// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phot.login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotLoginStore on _PhotLoginStoreBase, Store {
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_PhotLoginStoreBase.isEmailValid'))
          .value;
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_PhotLoginStoreBase.isPasswordValid'))
          .value;
  Computed<Function> _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed,
              name: '_PhotLoginStoreBase.loginPressed'))
          .value;

  final _$loggedUserAtom = Atom(name: '_PhotLoginStoreBase.loggedUser');

  @override
  Map<String, dynamic> get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(Map<String, dynamic> value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  final _$photAtom = Atom(name: '_PhotLoginStoreBase.phot');

  @override
  Photographer get phot {
    _$photAtom.reportRead();
    return super.phot;
  }

  @override
  set phot(Photographer value) {
    _$photAtom.reportWrite(value, super.phot, () {
      super.phot = value;
    });
  }

  final _$photLoggedAtom = Atom(name: '_PhotLoginStoreBase.photLogged');

  @override
  Photographer get photLogged {
    _$photLoggedAtom.reportRead();
    return super.photLogged;
  }

  @override
  set photLogged(Photographer value) {
    _$photLoggedAtom.reportWrite(value, super.photLogged, () {
      super.photLogged = value;
    });
  }

  final _$emailAtom = Atom(name: '_PhotLoginStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_PhotLoginStoreBase.password');

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

  final _$visibilityAtom = Atom(name: '_PhotLoginStoreBase.visibility');

  @override
  bool get visibility {
    _$visibilityAtom.reportRead();
    return super.visibility;
  }

  @override
  set visibility(bool value) {
    _$visibilityAtom.reportWrite(value, super.visibility, () {
      super.visibility = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PhotLoginStoreBase.isLoading');

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

  final _$isLoggedInAtom = Atom(name: '_PhotLoginStoreBase.isLoggedIn');

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

  final _$loginAsyncAction = AsyncAction('_PhotLoginStoreBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_PhotLoginStoreBaseActionController =
      ActionController(name: '_PhotLoginStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_PhotLoginStoreBaseActionController.startAction(
        name: '_PhotLoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_PhotLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_PhotLoginStoreBaseActionController.startAction(
        name: '_PhotLoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_PhotLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_PhotLoginStoreBaseActionController.startAction(
        name: '_PhotLoginStoreBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_PhotLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
phot: ${phot},
photLogged: ${photLogged},
email: ${email},
password: ${password},
visibility: ${visibility},
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
loginPressed: ${loginPressed}
    ''';
  }
}
