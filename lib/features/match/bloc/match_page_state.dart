import 'package:equatable/equatable.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/data/modules/match/entities/response/match_response.dart';
import 'package:janken_app/data/modules/match/match_consts.dart';

class MatchPageState extends Equatable {
  final MatchResponse? match;
  final DataState matchDataState;
  final DataState makeMoveDataState;
  final DataState seenResultDataState;
  final bool showResult;
  final MatchMove? userMove;

  const MatchPageState({
    this.match,
    this.matchDataState = DataState.none,
    this.makeMoveDataState = DataState.none,
    this.seenResultDataState = DataState.none,
    this.showResult = false,
    this.userMove,
  });

  MatchPageState copyWithData({
    DataState matchDataState = DataState.none,
    DataState makeMoveDataState = DataState.none,
    DataState seenResultDataState = DataState.none,
    MatchResponse? match,
    bool showResult = false,
    MatchMove? userMove,
  }) =>
      MatchPageState(
        match: match ?? this.match,
        matchDataState: matchDataState,
        makeMoveDataState: makeMoveDataState,
        seenResultDataState: seenResultDataState,
        showResult: showResult,
        userMove: userMove ?? this.userMove,
      );

  @override
  List<Object?> get props => [
        match,
        matchDataState,
        makeMoveDataState,
        seenResultDataState,
        showResult,
        userMove,
      ];
}
