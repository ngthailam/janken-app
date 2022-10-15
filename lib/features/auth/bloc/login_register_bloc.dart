import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/data/modules/auth/datasource/auth_repo.dart';
import 'package:janken_app/data/modules/auth/entities/request/login_request.dart';
import 'package:janken_app/data/modules/auth/entities/request/register_request.dart';
import 'package:janken_app/features/auth/bloc/login_register_state.dart';

@injectable
class LoginRegisterBloc extends Cubit<LoginRegisterState> {
  LoginRegisterBloc(this._authRepo) : super(LoginRegisterState());

  final AuthRepo _authRepo;

  initiate() {
    final isLoggedIn = _authRepo.isLoggedIn();
    if (isLoggedIn) {
      emit(state.copyWith(loginLoadState: DataState.success));
    } else {
      emit(state.copyWith(showForm: true));
    }
  }

  login(String name) async {
    try {
      // TODO: validate input here
      emit(state.copyWith(loginLoadState: DataState.loading));
      await _authRepo.login(LoginRequest(name));
      emit(state.copyWith(loginLoadState: DataState.success));
    } catch (e) {
      emit(state.copyWith(registerLoadState: DataState.failure));
    }
  }

  register(String name) async {
    try {
      // TODO: validate input here
      emit(state.copyWith(registerLoadState: DataState.loading));
      await _authRepo.register(RegisterRequest(name));
      login(name);
    } catch (e) {
      emit(state.copyWith(registerLoadState: DataState.failure));
    }
  }
}
