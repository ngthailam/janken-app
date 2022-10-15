import 'package:janken_app/data/modules/auth/auth_consts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String id;

  final String name;

  final int elo;

  final int matchCount;

  final UserRank rank;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  UserResponse(
    this.id,
    this.name,
    this.elo,
    this.matchCount,
    this.rank,
  );

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
