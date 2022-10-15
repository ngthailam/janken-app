// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_page_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MatchPageStateCWProxy {
  MatchPageState makeMoveDataState(DataState makeMoveDataState);

  MatchPageState match(MatchResponse? match);

  MatchPageState matchDataState(DataState matchDataState);

  MatchPageState showResult(bool showResult);

  MatchPageState userMove(MatchMove? userMove);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MatchPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MatchPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  MatchPageState call({
    DataState? makeMoveDataState,
    MatchResponse? match,
    DataState? matchDataState,
    bool? showResult,
    MatchMove? userMove,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMatchPageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMatchPageState.copyWith.fieldName(...)`
class _$MatchPageStateCWProxyImpl implements _$MatchPageStateCWProxy {
  final MatchPageState _value;

  const _$MatchPageStateCWProxyImpl(this._value);

  @override
  MatchPageState makeMoveDataState(DataState makeMoveDataState) =>
      this(makeMoveDataState: makeMoveDataState);

  @override
  MatchPageState match(MatchResponse? match) => this(match: match);

  @override
  MatchPageState matchDataState(DataState matchDataState) =>
      this(matchDataState: matchDataState);

  @override
  MatchPageState showResult(bool showResult) => this(showResult: showResult);

  @override
  MatchPageState userMove(MatchMove? userMove) => this(userMove: userMove);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MatchPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MatchPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  MatchPageState call({
    Object? makeMoveDataState = const $CopyWithPlaceholder(),
    Object? match = const $CopyWithPlaceholder(),
    Object? matchDataState = const $CopyWithPlaceholder(),
    Object? showResult = const $CopyWithPlaceholder(),
    Object? userMove = const $CopyWithPlaceholder(),
  }) {
    return MatchPageState(
      makeMoveDataState: makeMoveDataState == const $CopyWithPlaceholder() ||
              makeMoveDataState == null
          ? _value.makeMoveDataState
          // ignore: cast_nullable_to_non_nullable
          : makeMoveDataState as DataState,
      match: match == const $CopyWithPlaceholder()
          ? _value.match
          // ignore: cast_nullable_to_non_nullable
          : match as MatchResponse?,
      matchDataState: matchDataState == const $CopyWithPlaceholder() ||
              matchDataState == null
          ? _value.matchDataState
          // ignore: cast_nullable_to_non_nullable
          : matchDataState as DataState,
      showResult:
          showResult == const $CopyWithPlaceholder() || showResult == null
              ? _value.showResult
              // ignore: cast_nullable_to_non_nullable
              : showResult as bool,
      userMove: userMove == const $CopyWithPlaceholder()
          ? _value.userMove
          // ignore: cast_nullable_to_non_nullable
          : userMove as MatchMove?,
    );
  }
}

extension $MatchPageStateCopyWith on MatchPageState {
  /// Returns a callable class that can be used as follows: `instanceOfMatchPageState.copyWith(...)` or like so:`instanceOfMatchPageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MatchPageStateCWProxy get copyWith => _$MatchPageStateCWProxyImpl(this);
}
