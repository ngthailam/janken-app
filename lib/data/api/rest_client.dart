import 'package:janken_app/data/api/response_wrapper.dart';
import 'package:janken_app/data/api/dio_config.dart';
import 'package:janken_app/data/modules/auth/entities/request/login_request.dart';
import 'package:janken_app/data/modules/auth/entities/request/register_request.dart';
import 'package:janken_app/data/modules/auth/entities/response/login_response.dart';
import 'package:janken_app/data/modules/auth/entities/response/user_response.dart';
import 'package:janken_app/data/modules/match/entities/request/make_move_request.dart';
import 'package:janken_app/data/modules/match/entities/response/match_response.dart';
import 'package:janken_app/main.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

// TODO: migrate to module usage
void initRestClient() {
  getIt.registerLazySingleton<RestClient>(
    () => RestClient(getDioConfig()),
  );
}

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /// ======================== AUTH(B) ==============================
  @POST('auth/login')
  Future<ResponseWrapper<LoginResponse>> login(
      @Body() LoginRequest loginRequest);

  @POST('auth/register')
  Future register(@Body() RegisterRequest registerRequest);

  /// ======================== AUTH(E) ==============================

  /// ======================== MATCH(B) ==============================
  @GET('/match/{matchId}')
  Future<ResponseWrapper<MatchResponse>> getMatch(
      @Path('matchId') String matchId);

  @POST('match')
  Future<ResponseWrapper<MatchResponse>> createMatch();

  @POST('match/make-move')
  Future<ResponseWrapper<MatchResponse>> makeMove(
    @Body() MakeMoveRequest request,
  );

  @POST('match/seen-result/{matchId}')
  Future<ResponseWrapper<MatchResponse>> seenResult(
    @Path('matchId') String matchId,
  );

  /// ======================== MATCH(E) ==============================

  /// ======================== STATS(B) ==============================
  @GET('/stats/leaderboard')
  Future<ResponseWrapper<List<UserResponse>>> getLeaderboard();

  @GET('/stats/user')
  Future getPersonalStats();

  /// ======================== STATS(E) ==============================

  /// ======================== USER(B) ==============================
  @GET('/user/profile/self')
  Future<ResponseWrapper<UserResponse>> getProfile();

  /// ======================== USER(E) ==============================
}
