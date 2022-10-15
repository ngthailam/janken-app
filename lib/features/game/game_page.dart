import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:janken_app/features/game/bloc/game_page_bloc.dart';
import 'package:janken_app/features/game/bloc/game_page_state.dart';
import 'package:janken_app/main.dart';

class GamePage extends StatelessWidget {
  GamePage({Key? key}) : super(key: key);

  final GamePageBloc _bloc = getIt();

  void _blocListener(BuildContext context, GamePageState state) {
    final destination = state.destination;
    if (destination != null) {
      Navigator.of(context).pushNamed(
        destination.routePath,
        arguments: destination.data,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<GamePageBloc, GamePageState>(
          listener: _blocListener,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MaterialButton(
                  height: 200,
                  color: Colors.green,
                  onPressed: () {
                    _bloc.findMatch();
                  },
                  child: Text('Find random opponent'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
