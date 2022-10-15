import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String name;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  LoginRequest(this.name);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
