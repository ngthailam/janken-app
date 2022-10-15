// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_move_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeMoveRequest _$MakeMoveRequestFromJson(Map<String, dynamic> json) =>
    MakeMoveRequest(
      move: $enumDecode(_$MatchMoveEnumMap, json['move']),
      matchId: json['matchId'] as String,
    );

Map<String, dynamic> _$MakeMoveRequestToJson(MakeMoveRequest instance) =>
    <String, dynamic>{
      'move': _$MatchMoveEnumMap[instance.move]!,
      'matchId': instance.matchId,
    };

const _$MatchMoveEnumMap = {
  MatchMove.rock: 'ROCK',
  MatchMove.paper: 'PAPER',
  MatchMove.scissors: 'SCISSORS',
};
