import 'dart:async';

import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginUIModel {
  final LoggedState loginState;
  final UserInfoModel? userInfo;
  LoginUIModel copyWith({
    UserInfoModel? userInfo,
    LoggedState? loginState,
  }) {
    return LoginUIModel(
      userInfo: userInfo ?? this.userInfo,
      loginState: loginState ?? this.loginState,
    );
  }

  LoginUIModel({
    this.userInfo,
    required this.loginState,
  });
  static LoginUIModel getDefault() {
    return LoginUIModel(
      loginState: LoggedState.fail,
    );
  }
}

class LoginBloc {
  final uniqueID = DateTime.now().millisecondsSinceEpoch;
  final BehaviorSubject<LoginUIModel> _uiStream =
      BehaviorSubject<LoginUIModel>.seeded(LoginUIModel.getDefault());
  final BehaviorSubject<bool> _isRememberStream =
      BehaviorSubject<bool>.seeded(false);
  final SubjectString _userNameStream = SubjectString.seeded('');
  final SubjectString _passwordStream = SubjectString.seeded('');
  late StreamSubscription<UserInfoModel> _onchangedSubcription;
  LoginBloc() {
    _onchangedSubcription =
        GlobalBloc.userDataProvider.observerUserInfo().listen((userLoggedInfo) {
      _uiStream.add(_uiStream.value.copyWith(
        userInfo: userLoggedInfo,
        loginState: userLoggedInfo.loggingState,
      ));
    });
  }
  BehaviorSubject<LoginUIModel> observerLoginUIModel() {
    return _uiStream;
  }

  observerRemember() {
    return _isRememberStream;
  }

  toggleRemember() {
    _isRememberStream.add(!_isRememberStream.value);
  }

  login() {
    GlobalBloc.userDataProvider.loginWith(
      userName: _userNameStream.value,
      password: _passwordStream.value,
      loginType: LoginProviderType.internal,
    );
  }

  acceptUsername({required String username}) {
    _userNameStream.add(username);
  }

  acceptPassword({required String password}) {
    _passwordStream.add(password);
  }

  dispose() {
    _uiStream.close();
    _isRememberStream.close();
    _userNameStream.close();
    _passwordStream.close();
    _onchangedSubcription.cancel();
  }
}
