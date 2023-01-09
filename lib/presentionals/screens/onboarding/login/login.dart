import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/data_bloc/user_data_provider.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:iconsax/iconsax.dart';
import 'login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginBloc _loginBloc = LoginBloc();
  late StreamSubscription<LoginUIModel> _loginResultListener;
  @override
  void initState() {
    super.initState();
    _loginResultListener = _loginBloc
        .observerLoginUIModel()
        .distinct((a, b) => a.loginState == b.loginState)
        .skip(1) //skip the first time, because we seed them with default value
        .listen((userLoginInfo) {
      if (userLoginInfo.loginState == LoggedState.success) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          ScreenRoute.mainTabbar.name,
          (Route<dynamic> route) => false,
        );
      } else if (userLoginInfo.loginState == LoggedState.fail) {
        _showToast(context);
      }
    });
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).errorColor,
        content: const Text(
          'Wrong username or password(demo account: demo / 123456)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    _loginResultListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          AppHorizontalPaddingChild(
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppIconWithText(),
                      const AppVerticalPadding(
                        multiplier: 2,
                      ),
                      const AppVerticalPadding(),
                      Text(
                        AppLocalizations.of(context)!.loginTittle,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const AppVerticalPadding(),
                      AppInputField(
                        hintText: AppLocalizations.of(context)!.username,
                        leading: Iconsax.user,
                        onTextChanged: (value) =>
                            _loginBloc.acceptUsername(username: value),
                      ),
                      const AppVerticalPadding(),
                      AppInputField(
                        hintText: AppLocalizations.of(context)!.password,
                        leading: Iconsax.lock,
                        isSecured: true,
                        onTextChanged: (value) =>
                            _loginBloc.acceptPassword(password: value),
                      ),
                      const AppVerticalPadding(),
                      StreamBuilder<bool>(
                          stream: _loginBloc.observerRemember(),
                          builder: (context, snapshot) {
                            return AppTickWithDescriptionText(
                              tittle: AppLocalizations.of(context)!.remember,
                              isShowTickIcon: snapshot.data ?? false,
                              onPressed: () => _loginBloc.toggleRemember(),
                            );
                          }),
                      const AppVerticalPadding(),
                      AppButton(
                        tittle: AppLocalizations.of(context)!.signinWithPass,
                        onPresssed: () => _loginBloc.login(),
                      ),
                      const AppVerticalPadding(),
                      AppTextClickable(
                        tittle: AppLocalizations.of(context)!.forgot,
                        onPressed: () => Navigator.of(context)
                            .pushNamed(ScreenRoute.signup.name),
                      ),
                      const AppVerticalPadding(),
                      const VerticalSliderWithText(),
                      const AppVerticalPadding(),
                      AppSocialButtons(),
                      const AppVerticalPadding(),
                      AppTextClickableWithDescription(
                        clickableText: AppLocalizations.of(context)!.signup,
                        normalText:
                            AppLocalizations.of(context)!.dontHaveAccount,
                        onPressed: () => Navigator.of(context).pushNamed(
                          ScreenRoute.signup.name,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<LoginUIModel>(
            stream: _loginBloc.observerLoginUIModel(),
            builder: (context, snapshot) {
              bool isLoading =
                  snapshot.data?.loginState == LoggedState.onCheckingWithServer;
              return AppLoadingCenter(isLoading: isLoading);
            },
          ),
        ],
      ),
    );
  }
}
