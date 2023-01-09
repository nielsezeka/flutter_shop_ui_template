import 'package:rxdart/rxdart.dart';

class SignUpBloc {
  BehaviorSubject<bool> isRememberStream = BehaviorSubject<bool>.seeded(false);

  toggleRemember() {
    isRememberStream.add(!isRememberStream.value);
  }
}
