// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as String,
      json['name'] as String,
      json['elo'] as int,
      json['matchCount'] as int,
      $enumDecode(_$UserRankEnumMap, json['rank']),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'elo': instance.elo,
      'matchCount': instance.matchCount,
      'rank': _$UserRankEnumMap[instance.rank]!,
    };

const _$UserRankEnumMap = {
  UserRank.none: 'NONE',
  UserRank.bronze: 'BRONZE',
  UserRank.silver: 'SILVER',
  UserRank.gold: 'GOLD',
  UserRank.diamond: 'DIAMOND',
  UserRank.challenger: 'CHALLENGER',
};
