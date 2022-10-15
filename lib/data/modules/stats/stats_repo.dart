import 'package:injectable/injectable.dart';
import 'package:janken_app/data/api/rest_client.dart';
import 'package:janken_app/data/modules/auth/entities/response/user_response.dart';

abstract class StatsRepo {
  Future<List<UserResponse>> getLeaderboard();
}

@Injectable(as: StatsRepo)
class StatsRepoImpl extends StatsRepo {
  final RestClient _restClient;

  StatsRepoImpl(this._restClient);

  @override
  Future<List<UserResponse>> getLeaderboard() {
    return _restClient.getLeaderboard().then((value) => value.data);
  }
}
