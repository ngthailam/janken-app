import 'package:injectable/injectable.dart';

abstract class GameRepo {

}

@Injectable(as: GameRepo)
class GameRepoImpl extends GameRepo {}