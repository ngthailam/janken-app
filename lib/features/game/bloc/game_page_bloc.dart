import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:janken_app/core/app_router.dart';
import 'package:janken_app/core/helper/destination.dart';
import 'package:janken_app/data/modules/match/datasource/match_repo.dart';
import 'package:janken_app/features/game/bloc/game_page_state.dart';

@injectable
class GamePageBloc extends Cubit<GamePageState> {
  GamePageBloc(this._matchRepo) : super(GamePageState());

  final MatchRepo _matchRepo;

  findMatch() async {
    final match = await _matchRepo.create();
    if (state.destination == null) {
      emit(state.copyWith(
        destination: Destination(
          routePath: AppRouter.match,
          data: match.id,
        ),
      ));
      return;
    }
  }
}
