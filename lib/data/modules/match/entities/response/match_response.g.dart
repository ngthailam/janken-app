// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchResponse _$MatchResponseFromJson(Map<String, dynamic> json) =>
    MatchResponse(
      json['id'] as String,
      json['desc'] as String?,
      $enumDecodeNullable(_$MatchMoveEnumMap, json['primaryUserMove']),
      $enumDecodeNullable(_$MatchMoveEnumMap, json['secondaryUserMove']),
      json['primaryUserId'] as String?,
      json['secondaryUserId'] as String?,
      json['isPrimaryUserSeenResult'] as bool,
      json['isSecondaryUserSeenResult'] as bool,
      json['primaryUserElo'] as int,
      json['secondaryUserElo'] as int,
    );

Map<String, dynamic> _$MatchResponseToJson(MatchResponse instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('desc', instance.desc);
  writeNotNull('primaryUserMove', _$MatchMoveEnumMap[instance.primaryUserMove]);
  writeNotNull(
      'secondaryUserMove', _$MatchMoveEnumMap[instance.secondaryUserMove]);
  writeNotNull('primaryUserId', instance.primaryUserId);
  writeNotNull('secondaryUserId', instance.secondaryUserId);
  val['isPrimaryUserSeenResult'] = instance.isPrimaryUserSeenResult;
  val['isSecondaryUserSeenResult'] = instance.isSecondaryUserSeenResult;
  val['primaryUserElo'] = instance.primaryUserElo;
  val['secondaryUserElo'] = instance.secondaryUserElo;
  return val;
}

const _$MatchMoveEnumMap = {
  MatchMove.rock: 'ROCK',
  MatchMove.paper: 'PAPER',
  MatchMove.scissors: 'SCISSORS',
};
