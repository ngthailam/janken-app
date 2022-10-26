import 'package:injectable/injectable.dart';
import 'package:janken_app/data/api/rest_client.dart';
import 'package:janken_app/data/modules/match/entities/request/make_move_request.dart';
import 'package:janken_app/data/modules/match/entities/response/match_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MatchRepo {
  Future<MatchResponse> create();

  Future<MatchResponse> getMatch(String matchId);

  Future makeMove(MakeMoveRequest request);

  Future<MatchResponse> seenResult(String matchId);

  Future<bool> isSeenResult(String matchId);
}

@Injectable(as: MatchRepo)
class MatchRepoImpl extends MatchRepo {
  final RestClient _restClient;

  MatchRepoImpl(this._restClient);

  @override
  Future<MatchResponse> create() {
    return _restClient.createMatch().then((value) => value.data);
  }

  @override
  Future<MatchResponse> getMatch(String matchId) {
    return _restClient.getMatch(matchId).then((value) => value.data);
  }

  @override
  Future makeMove(MakeMoveRequest request) {
    return _restClient.makeMove(request);
  }

  @override
  Future<MatchResponse> seenResult(String matchId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('SEEN_RESULT_3_$matchId', true);
    return _restClient.seenResult(matchId).then((value) => value.data);
  }

  @override
  Future<bool> isSeenResult(String matchId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('SEEN_RESULT_3_$matchId') ?? false;
  }
}
