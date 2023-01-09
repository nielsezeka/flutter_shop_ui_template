import 'package:rxdart/subjects.dart';

class ProfileAddressAddBloc {
  BehaviorSubject<String> nameAddress = BehaviorSubject<String>.seeded('');
  BehaviorSubject<String> detailAddress = BehaviorSubject<String>.seeded('');
}
