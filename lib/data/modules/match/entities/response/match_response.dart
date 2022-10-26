import 'package:equatable/equatable.dart';
import 'package:janken_app/core/calculator/match_result_calculator.dart';
import 'package:janken_app/data/modules/match/match_consts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_response.g.dart';

@JsonSerializable()
class MatchResponse extends Equatable {
  final String id;
  final MatchMove? primaryUserMove;
  final MatchMove? secondaryUserMove;
  final String? primaryUserId;
  final String? secondaryUserId;
  final bool isPrimaryUserSeenResult;
  final bool isSecondaryUserSeenResult;
  final int primaryUserElo;
  final int secondaryUserElo;

  factory MatchResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchResponseFromJson(json);

  const MatchResponse(
      this.id,
      this.primaryUserMove,
      this.secondaryUserMove,
      this.primaryUserId,
      this.secondaryUserId,
      this.isPrimaryUserSeenResult,
      this.isSecondaryUserSeenResult,
      this.primaryUserElo,
      this.secondaryUserElo);

  MatchResult getResult(String currentUserId) {
    if (currentUserId.isEmpty || primaryUserId?.isNotEmpty != true) {
      return MatchResult.none;
    }
    if (primaryUserMove == null || secondaryUserMove == null) {
      return MatchResult.none;
    }
    final isPrimaryUser = currentUserId == primaryUserId;
    return MatchResultCalculator.calculate(
      isPrimaryUser ? primaryUserMove! : secondaryUserMove!,
      isPrimaryUser ? secondaryUserMove! : primaryUserMove!,
    );
  }

  MatchMove? getOpponentMove(String currentUserId) {
    return currentUserId == primaryUserId ? secondaryUserMove : primaryUserMove;
  }

  MatchMove? getUserMove(String currentUserId) {
    return currentUserId == primaryUserId ? primaryUserMove : secondaryUserMove;
  }

  bool isUserMadeMove(String currentUserId) {
    return getUserMove(currentUserId) != null;
  }

  Map<String, dynamic> toJson() => _$MatchResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        primaryUserMove,
        secondaryUserMove,
        primaryUserId,
        secondaryUserId,
        isPrimaryUserSeenResult,
        isSecondaryUserSeenResult,
        primaryUserElo,
        secondaryUserElo,
      ];
}
