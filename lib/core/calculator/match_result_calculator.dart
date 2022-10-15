import 'package:janken_app/data/modules/match/match_consts.dart';

const resultMap = {
  MatchMove.rock: {
    MatchMove.rock: MatchResult.draw,
    MatchMove.paper: MatchResult.lose,
    MatchMove.scissors: MatchResult.win,
  },
  MatchMove.paper: {
    MatchMove.rock: MatchResult.win,
    MatchMove.paper: MatchResult.draw,
    MatchMove.scissors: MatchResult.lose,
  },
  MatchMove.scissors: {
    MatchMove.rock: MatchResult.lose,
    MatchMove.paper: MatchResult.win,
    MatchMove.scissors: MatchResult.draw,
  }
};

class MatchResultCalculator {
  static MatchResult calculate(
    MatchMove primaryUserMove,
    MatchMove secondaryUserMove,
  ) {
    return resultMap[primaryUserMove]![secondaryUserMove]!;
  }
}
