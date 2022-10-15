import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:janken_app/core/helper/loading_state.dart';

part 'login_register_state.g.dart';

@CopyWith()
class LoginRegisterState {
  final DataState loginLoadState;
  final DataState registerLoadState;
  final bool showForm;

  LoginRegisterState({
    this.loginLoadState = DataState.none,
    this.registerLoadState = DataState.none,
    this.showForm = false,
  });
}
