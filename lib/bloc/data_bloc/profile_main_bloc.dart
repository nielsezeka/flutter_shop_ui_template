import 'package:rxdart/rxdart.dart';
import '../global_bloc.dart';

class ProfileInfoUIModel {
  final String userName;
  final String userImageAvatarurl;

  ProfileInfoUIModel({
    required this.userName,
    required this.userImageAvatarurl,
  });
}

class ProfileMainBloc {
  final BehaviorSubject<ProfileInfoUIModel> _uiModel =
      BehaviorSubject<ProfileInfoUIModel>.seeded(ProfileInfoUIModel(
    userImageAvatarurl: '',
    userName: '',
  ));
  final BehaviorSubject<UserAddress?> _edittingAddress =
      BehaviorSubject<UserAddress?>.seeded(null);
  ProfileMainBloc() {
    GlobalBloc.userDataProvider.observerUserInfo().switchMap((value) {
      return Stream.value(
        ProfileInfoUIModel(
          userImageAvatarurl: value.userAvatarUrl,
          userName: value.name,
        ),
      );
    }).listen((event) {
      _uiModel.add(event);
    });
  }
  observerUserCommonInfo() {
    return _uiModel;
  }

  setFocusEditAddress(UserAddress? userAddress) {
    _edittingAddress.add(userAddress);
  }

  UserAddress? currentFocus() {
    return _edittingAddress.value;
  }
}
