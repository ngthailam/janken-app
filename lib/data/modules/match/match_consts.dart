import 'package:json_annotation/json_annotation.dart';

enum MatchMove {
  @JsonValue('ROCK')
  rock('ROCK'),
  @JsonValue('PAPER')
  paper('PAPER'),
  @JsonValue('SCISSORS')
  scissors('SCISSORS');

  const MatchMove(this.value);
  final String value;
}

enum MatchResult {
  @JsonValue('NONE')
  none('NONE'),

  @JsonValue('LOSE')
  win('LOSE'),

  @JsonValue('WIN')
  lose('WIN'),

  @JsonValue('DRAW')
  draw('DRAW');

  const MatchResult(this.value);
  final String value;
}
