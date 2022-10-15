import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/data/modules/stats/stats_repo.dart';
import 'package:janken_app/features/leaderboard/bloc/leaderboard_page_state.dart';

@injectable
class LeaderboardPageBloc extends Cubit<LeaderboardPageState> {
  LeaderboardPageBloc(this._statsRepo) : super(LeaderboardPageState());

  final StatsRepo _statsRepo;

  getLeaderboard() async {
    try {
      emit(state.copyWith(usersDataState: DataState.loading));
      final users = await _statsRepo.getLeaderboard();
      emit(state.copyWith(
        usersDataState: DataState.success,
        users: users,
      ));
    } catch (e) {
      emit(state.copyWith(usersDataState: DataState.failure));
    }
  }
}
