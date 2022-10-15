// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_register_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginRegisterStateCWProxy {
  LoginRegisterState loginLoadState(DataState loginLoadState);

  LoginRegisterState registerLoadState(DataState registerLoadState);

  LoginRegisterState showForm(bool showForm);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginRegisterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginRegisterState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginRegisterState call({
    DataState? loginLoadState,
    DataState? registerLoadState,
    bool? showForm,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginRegisterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginRegisterState.copyWith.fieldName(...)`
class _$LoginRegisterStateCWProxyImpl implements _$LoginRegisterStateCWProxy {
  final LoginRegisterState _value;

  const _$LoginRegisterStateCWProxyImpl(this._value);

  @override
  LoginRegisterState loginLoadState(DataState loginLoadState) =>
      this(loginLoadState: loginLoadState);

  @override
  LoginRegisterState registerLoadState(DataState registerLoadState) =>
      this(registerLoadState: registerLoadState);

  @override
  LoginRegisterState showForm(bool showForm) => this(showForm: showForm);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginRegisterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginRegisterState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginRegisterState call({
    Object? loginLoadState = const $CopyWithPlaceholder(),
    Object? registerLoadState = const $CopyWithPlaceholder(),
    Object? showForm = const $CopyWithPlaceholder(),
  }) {
    return LoginRegisterState(
      loginLoadState: loginLoadState == const $CopyWithPlaceholder() ||
              loginLoadState == null
          ? _value.loginLoadState
          // ignore: cast_nullable_to_non_nullable
          : loginLoadState as DataState,
      registerLoadState: registerLoadState == const $CopyWithPlaceholder() ||
              registerLoadState == null
          ? _value.registerLoadState
          // ignore: cast_nullable_to_non_nullable
          : registerLoadState as DataState,
      showForm: showForm == const $CopyWithPlaceholder() || showForm == null
          ? _value.showForm
          // ignore: cast_nullable_to_non_nullable
          : showForm as bool,
    );
  }
}

extension $LoginRegisterStateCopyWith on LoginRegisterState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginRegisterState.copyWith(...)` or like so:`instanceOfLoginRegisterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginRegisterStateCWProxy get copyWith =>
      _$LoginRegisterStateCWProxyImpl(this);
}
