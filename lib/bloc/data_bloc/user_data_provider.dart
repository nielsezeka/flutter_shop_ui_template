import 'dart:convert';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

enum LoggedState {
  success,
  onCheckingWithServer,
  fail,
}

enum LoginProviderType {
  google,
  facebook,
  apple,
  internal,
  none,
}

class UserAddress {
  final String addressName;
  final String addressLocationAsString;
  final String uniqueId;
  UserAddress({
    required this.addressName,
    required this.addressLocationAsString,
    required this.uniqueId,
  });
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAddress &&
          runtimeType == other.runtimeType &&
          uniqueId == other.uniqueId;

  @override
  int get hashCode => uniqueId.hashCode;
}

class UserInfoModel {
  final String name;
  final String userId;
  final List<UserAddress> addresses;
  final String userAvatarUrl;
  final LoginProviderType loggedType;
  final String localPIN;
  final LoggedState loggingState;
  final int moneyInLocalWallet;
  List<TransactionModelServerResponse> transactions;
  UserInfoModel({
    required this.name,
    required this.addresses,
    required this.loggedType,
    required this.localPIN,
    required this.loggingState,
    required this.userAvatarUrl,
    required this.userId,
    required this.moneyInLocalWallet,
    required this.transactions,
  });
  UserInfoModel copyWith({
    String? name,
    LoggedState? loggingState,
    String? userAvatarUrl,
    List<UserAddress>? addresses,
    String? userId,
    int? moneyInLocalWallet,
    List<TransactionModelServerResponse>? transactions,
  }) {
    return UserInfoModel(
      addresses: addresses ?? this.addresses,
      name: name ?? this.name,
      loggedType: loggedType,
      localPIN: localPIN,
      loggingState: loggingState ?? this.loggingState,
      userAvatarUrl: userAvatarUrl ?? this.userAvatarUrl,
      userId: userId ?? this.userId,
      moneyInLocalWallet: moneyInLocalWallet ?? this.moneyInLocalWallet,
      transactions: transactions ?? this.transactions,
    );
  }
}

class UserDataProvider {
  final BehaviorSubject<UserInfoModel> _userInfoStream =
      BehaviorSubject<UserInfoModel>.seeded(
    UserInfoModel(
      name: 'Awesome guy',
      userId: '123',
      addresses: [
        UserAddress(
          addressName: 'Home',
          addressLocationAsString: '14 Great Manchester',
          uniqueId: const Uuid().v4().toString(),
        ),
        UserAddress(
          addressName: 'Working',
          addressLocationAsString: '1235 Westchester RD',
          uniqueId: const Uuid().v4().toString(),
        ),
      ],
      loggedType: LoginProviderType.none,
      loggingState: LoggedState.fail,
      localPIN: '',
      userAvatarUrl: '',
      moneyInLocalWallet: 1234,
      transactions: [],
    ),
  );
  updateAddress(List<UserAddress> addresses) {
    _userInfoStream.add(_userInfoStream.value.copyWith(addresses: addresses));
  }

  loginWith({
    required String userName,
    required String password,
    required LoginProviderType loginType,
  }) async {
    _userInfoStream.add(
      _userInfoStream.value.copyWith(
        loggingState: LoggedState.onCheckingWithServer,
      ),
    );
    final loginResult = await AppServices.authService.auth(
      userName: userName,
      password: password,
    );
    // you should parse your json here, this is the sample logic
    // should use copy with to update the usernme,avatar....
    final parsedJson = jsonDecode(loginResult);

    if (parsedJson['login'] ?? false) {
      _userInfoStream.add(
        _userInfoStream.value.copyWith(
          name: userName,
          loggingState: LoggedState.success,
          userAvatarUrl: 'https://i.pravatar.cc/300',
        ),
      );
    } else {
      _userInfoStream.add(
        _userInfoStream.value.copyWith(
          name: userName,
          loggingState: LoggedState.fail,
        ),
      );
    }
    _updateTransaction();
  }

  _updateTransaction() async {
    final transactions =
        await AppServices.transactionServerProviable.getTransactions();
    _userInfoStream.add(
      _userInfoStream.value.copyWith(
        transactions: transactions,
      ),
    );
  }

  BehaviorSubject<UserInfoModel> observerUserInfo() {
    return _userInfoStream;
  }

  void logout() {
    _userInfoStream.add(
      UserInfoModel(
        name: '',
        userId: '',
        addresses: [],
        loggedType: LoginProviderType.none,
        loggingState: LoggedState.fail,
        localPIN: '',
        userAvatarUrl: '',
        moneyInLocalWallet: 0,
        transactions: [],
      ),
    );
  }

  deleteAddress(UserAddress address) {
    final updatedAddress = _userInfoStream.value.addresses;
    updatedAddress.removeWhere((element) => element == address);
    _userInfoStream.add(
      _userInfoStream.value.copyWith(
        addresses: updatedAddress,
      ),
    );
  }

  void addNewAddress(String address, String detail) {
    final updatedAddress = _userInfoStream.value.addresses;
    updatedAddress.add(
      UserAddress(
        addressLocationAsString: detail,
        addressName: address,
        uniqueId: const Uuid().v4().toString(),
      ),
    );
    _userInfoStream.add(
      _userInfoStream.value.copyWith(
        addresses: updatedAddress,
      ),
    );
  }

  void editAddress(String address, String detail) {
    UserAddress? currentEditted = GlobalBloc.profileMainBloc.currentFocus();
    if (currentEditted != null) {
      List<UserAddress> userAddresses =
          _userInfoStream.value.addresses.map((e) {
        if (e.uniqueId == currentEditted.uniqueId) {
          return UserAddress(
            addressName: address,
            addressLocationAsString: detail,
            uniqueId: e.uniqueId,
          );
        }
        return e;
      }).toList();
      _userInfoStream.add(
        _userInfoStream.value.copyWith(
          addresses: userAddresses,
        ),
      );
    }
  }
}
