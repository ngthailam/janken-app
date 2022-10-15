import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String accessToken;

  final String uid;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginResponse(this.accessToken, this.uid);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
