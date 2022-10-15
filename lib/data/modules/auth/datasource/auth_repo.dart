import 'package:injectable/injectable.dart';
import 'package:janken_app/data/api/rest_client.dart';
import 'package:janken_app/data/modules/auth/datasource/auth_local_ds.dart';
import 'package:janken_app/data/modules/auth/entities/request/login_request.dart';
import 'package:janken_app/data/modules/auth/entities/request/register_request.dart';
import 'package:janken_app/data/modules/auth/entities/response/user_response.dart';

abstract class AuthRepo {
  Future login(LoginRequest loginRequest);

  Future register(RegisterRequest registerRequest);

  Future<UserResponse> getProfile();

  bool isLoggedIn();

  UserResponse getUser();
}

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final RestClient _restClient;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(this._restClient, this._authLocalDataSource);

  @override
  UserResponse getUser() {
    return _authLocalDataSource.user;
  }

  @override
  bool isLoggedIn() {
    return _authLocalDataSource.isLoggedIn;
  }

  @override
  login(LoginRequest loginRequest) async {
    final response = await _restClient.login(loginRequest);
    _authLocalDataSource.onLoginSuccess(response.data);
    // TODO: consider awaiting this
    getProfile();
    return;
  }

  @override
  register(RegisterRequest registerRequest) async {
    final register = await _restClient.register(registerRequest);
    return;
  }

  @override
  Future<UserResponse> getProfile() {
    return _restClient.getProfile().then((value) {
      _authLocalDataSource.saveProfile(value.data);
      return value.data;
    });
  }
}
