import '../auth_serviceable.dart';

class DummyAuthService implements AuthServicable {
  final String usenameDemo;
  final String passwordDemo;
  DummyAuthService({required this.usenameDemo, required this.passwordDemo});

  @override
  Future<String> auth({required String userName, required String password}) {
    // should return some json here....
    // we just return a sample data
    // after 1 sec, the login will be return...
    final loginStatus = (userName == usenameDemo) && (password == passwordDemo);
    if (loginStatus) {
      return Future.delayed(const Duration(seconds: 1), () => '{"login":true}');
    } else {
      return Future.delayed(
          const Duration(seconds: 1), () => '{"login":false}');
    }
  }
}
