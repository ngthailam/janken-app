import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/data/modules/match/entities/response/match_response.dart';
import 'package:janken_app/data/modules/match/match_consts.dart';

part 'match_page_state.g.dart';

@CopyWith()
class MatchPageState {
  final MatchResponse? match;
  final DataState matchDataState;
  final DataState makeMoveDataState;
  final bool showResult;
  final MatchMove? userMove;

  MatchPageState({
    this.match,
    this.matchDataState = DataState.none,
    this.makeMoveDataState = DataState.none,
    this.showResult = false,
    this.userMove,
  });
}
