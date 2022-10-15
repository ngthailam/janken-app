// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_page_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeaderboardPageStateCWProxy {
  LeaderboardPageState users(List<UserResponse> users);

  LeaderboardPageState usersDataState(DataState usersDataState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeaderboardPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeaderboardPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeaderboardPageState call({
    List<UserResponse>? users,
    DataState? usersDataState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeaderboardPageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeaderboardPageState.copyWith.fieldName(...)`
class _$LeaderboardPageStateCWProxyImpl
    implements _$LeaderboardPageStateCWProxy {
  final LeaderboardPageState _value;

  const _$LeaderboardPageStateCWProxyImpl(this._value);

  @override
  LeaderboardPageState users(List<UserResponse> users) => this(users: users);

  @override
  LeaderboardPageState usersDataState(DataState usersDataState) =>
      this(usersDataState: usersDataState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeaderboardPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeaderboardPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  LeaderboardPageState call({
    Object? users = const $CopyWithPlaceholder(),
    Object? usersDataState = const $CopyWithPlaceholder(),
  }) {
    return LeaderboardPageState(
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<UserResponse>,
      usersDataState: usersDataState == const $CopyWithPlaceholder() ||
              usersDataState == null
          ? _value.usersDataState
          // ignore: cast_nullable_to_non_nullable
          : usersDataState as DataState,
    );
  }
}

extension $LeaderboardPageStateCopyWith on LeaderboardPageState {
  /// Returns a callable class that can be used as follows: `instanceOfLeaderboardPageState.copyWith(...)` or like so:`instanceOfLeaderboardPageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeaderboardPageStateCWProxy get copyWith =>
      _$LeaderboardPageStateCWProxyImpl(this);
}
