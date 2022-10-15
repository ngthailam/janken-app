import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/data/modules/auth/datasource/auth_repo.dart';
import 'package:janken_app/data/modules/match/datasource/match_repo.dart';
import 'package:janken_app/data/modules/match/entities/request/make_move_request.dart';
import 'package:janken_app/data/modules/match/match_consts.dart';
import 'package:janken_app/data/modules/match/socket/match_socket_events.dart';
import 'package:janken_app/data/modules/match/socket/match_socket_service.dart';
import 'package:janken_app/features/match/bloc/match_page_state.dart';

@injectable
class MatchPageBloc extends Cubit<MatchPageState> {
  MatchPageBloc(
    this._matchRepo,
    this._authRepo,
    this._matchSocketService,
  ) : super(MatchPageState());

  final MatchRepo _matchRepo;
  final AuthRepo _authRepo;
  final MatchSocketService _matchSocketService;

  String matchId = '';
  // TODO: refactor this
  String userId = '';

  initiate(String matchId) async {
    this.matchId = matchId;
    userId = _authRepo.getUser().id;

    getMatch(matchId);

    // TODO: check
    _matchSocketService.connect();
    _matchSocketService.eventsStream().listen((event) {
      if (event.name == MatchSocketEvents.onMatchResult.name) {
        getMatch(matchId);
      }
    });
  }

  getMatch(String matchId) async {
    try {
      emit(state.copyWith(matchDataState: DataState.loading));
      final match = await _matchRepo.getMatch(matchId);
      final hasMatchResult = match.getResult(userId) != MatchResult.none;
      final isSeenMatchResult = await _matchRepo.isSeenResult(matchId);
      emit(state.copyWith(
        matchDataState: DataState.success,
        match: match,
        showResult: hasMatchResult && !isSeenMatchResult,
      ));
    } catch (e) {
      print("ZZLL error $e");
      emit(state.copyWith(matchDataState: DataState.failure));
    }
  }

  makeMove(MatchMove move) async {
    try {
      if (state.match == null) {
        return;
      }

      if (state.match!.isUserMadeMove(userId)) {
        return;
      }

      emit(
        state.copyWith(makeMoveDataState: DataState.loading, userMove: move),
      );
      await _matchRepo.makeMove(MakeMoveRequest(move: move, matchId: matchId));
      // TODO: should I refetch match result ????
      emit(state.copyWith(makeMoveDataState: DataState.success));
    } catch (e) {
      emit(state.copyWith(makeMoveDataState: DataState.failure));
    }
  }

  seenResult() async {
    try {
      emit(state.copyWith(makeMoveDataState: DataState.loading));
      await _matchRepo.seenResult(matchId);
      emit(state.copyWith(makeMoveDataState: DataState.success));
    } catch (e) {
      emit(state.copyWith(makeMoveDataState: DataState.failure));
    }
  }

  void onDispose() {
    _matchSocketService.dispose();
  }
}
