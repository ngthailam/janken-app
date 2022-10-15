// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_page_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GamePageStateCWProxy {
  GamePageState destination(Destination? destination);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GamePageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GamePageState(...).copyWith(id: 12, name: "My name")
  /// ````
  GamePageState call({
    Destination? destination,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGamePageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGamePageState.copyWith.fieldName(...)`
class _$GamePageStateCWProxyImpl implements _$GamePageStateCWProxy {
  final GamePageState _value;

  const _$GamePageStateCWProxyImpl(this._value);

  @override
  GamePageState destination(Destination? destination) =>
      this(destination: destination);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GamePageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GamePageState(...).copyWith(id: 12, name: "My name")
  /// ````
  GamePageState call({
    Object? destination = const $CopyWithPlaceholder(),
  }) {
    return GamePageState(
      destination: destination == const $CopyWithPlaceholder()
          ? _value.destination
          // ignore: cast_nullable_to_non_nullable
          : destination as Destination?,
    );
  }
}

extension $GamePageStateCopyWith on GamePageState {
  /// Returns a callable class that can be used as follows: `instanceOfGamePageState.copyWith(...)` or like so:`instanceOfGamePageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GamePageStateCWProxy get copyWith => _$GamePageStateCWProxyImpl(this);
}
