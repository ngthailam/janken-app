import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/data/modules/auth/entities/response/user_response.dart';

part 'leaderboard_page_state.g.dart';

@CopyWith()
class LeaderboardPageState {
  final List<UserResponse> users;

  final DataState usersDataState;

  LeaderboardPageState({
    this.users = const [],
    this.usersDataState = DataState.none,
  });
}
