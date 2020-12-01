// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserLoginStore on _UserLoginStoreBase, Store {
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_UserLoginStoreBase.isEmailValid'))
          .value;
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_UserLoginStoreBase.isPasswordValid'))
          .value;
  Computed<Function> _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed,
              name: '_UserLoginStoreBase.loginPressed'))
          .value;

  final _$loggedUserAtom = Atom(name: '_UserLoginStoreBase.loggedUser');

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

  final _$userAtom = Atom(name: '_UserLoginStoreBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$userLoggedAtom = Atom(name: '_UserLoginStoreBase.userLogged');

  @override
  User get userLogged {
    _$userLoggedAtom.reportRead();
    return super.userLogged;
  }

  @override
  set userLogged(User value) {
    _$userLoggedAtom.reportWrite(value, super.userLogged, () {
      super.userLogged = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserLoginStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_UserLoginStoreBase.password');

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

  final _$visibilityAtom = Atom(name: '_UserLoginStoreBase.visibility');

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

  final _$isLoadingAtom = Atom(name: '_UserLoginStoreBase.isLoading');

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

  final _$isLoggedInAtom = Atom(name: '_UserLoginStoreBase.isLoggedIn');

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

  final _$loginAsyncAction = AsyncAction('_UserLoginStoreBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_UserLoginStoreBaseActionController =
      ActionController(name: '_UserLoginStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_UserLoginStoreBaseActionController.startAction(
        name: '_UserLoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_UserLoginStoreBaseActionController.startAction(
        name: '_UserLoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_UserLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_UserLoginStoreBaseActionController.startAction(
        name: '_UserLoginStoreBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_UserLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
user: ${user},
userLogged: ${userLogged},
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
