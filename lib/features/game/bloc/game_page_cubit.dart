import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:janken_app/features/game/bloc/game_page_state.dart';

@injectable
class GamePageCubit extends Cubit<GamePageState> {
  GamePageCubit() : super(GamePageState());
}
