import 'package:janken_app/data/modules/match/match_consts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'make_move_request.g.dart';

@JsonSerializable()
class MakeMoveRequest {
  final MatchMove move;

  final String matchId;

  factory MakeMoveRequest.fromJson(Map<String, dynamic> json) =>
      _$MakeMoveRequestFromJson(json);

  MakeMoveRequest({required this.move, required this.matchId});

  Map<String, dynamic> toJson() => _$MakeMoveRequestToJson(this);
}
