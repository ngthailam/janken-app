import 'package:json_annotation/json_annotation.dart';

enum UserRank {
  @JsonValue('NONE')
  none('NONE'),

  @JsonValue('BRONZE')
  bronze('BRONZE'),

  @JsonValue('SILVER')
  silver('SILVER'),

  @JsonValue('GOLD')
  gold('GOLD'),

  @JsonValue('DIAMOND')
  diamond('DIAMOND'),

  @JsonValue('CHALLENGER')
  challenger('CHALLENGER');

  const UserRank(this.value);

  final String value;
}
