import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:janken_app/core/helper/destination.dart';

part 'game_page_state.g.dart';

@CopyWith()
class GamePageState {
  final Destination? destination;

  GamePageState({this.destination});
}
