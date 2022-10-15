import 'package:injectable/injectable.dart';
import 'package:janken_app/data/modules/auth/entities/response/login_response.dart';
import 'package:janken_app/data/modules/auth/entities/response/user_response.dart';

abstract class AuthLocalDataSource {
  bool get isLoggedIn;

  String get accessToken;

  UserResponse get user;

  onLoginSuccess(LoginResponse loginResponse);

  onLogout();

  saveProfile(UserResponse data);
}

@Singleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  bool _isLoggedIn = false;
  @override
  bool get isLoggedIn => _isLoggedIn;

  String _accessToken = '';
  @override
  String get accessToken => _accessToken;

  UserResponse? _user;
  @override
  UserResponse get user => _user!;

  @override
  onLoginSuccess(LoginResponse loginResponse) {
    _isLoggedIn = true;
    _accessToken = loginResponse.accessToken;
  }

  @override
  onLogout() {
    _isLoggedIn = false;
    _accessToken = '';
  }

  @override
  saveProfile(UserResponse data) {
    _user = data;
  }
}
