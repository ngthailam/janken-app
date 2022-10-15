import 'package:json_annotation/json_annotation.dart';

part 'response_wrapper.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseWrapper<T> {
  final T data;
  final num statusCode;
  final String? message;

  ResponseWrapper(this.data, this.statusCode, this.message);

  factory ResponseWrapper.fromJson(Map<String, dynamic> json, fromJsonT) =>
      _$ResponseWrapperFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(toJsonT) =>
      _$ResponseWrapperToJson(this, toJsonT);
}
