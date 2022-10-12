import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:janken_app/features/game/bloc/game_page_cubit.dart';

class GamePage extends StatelessWidget {
  GamePage({Key? key}) : super(key: key);

  final GamePageCubit _cubit = GamePageCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _cubit,
        child: const Center(
          child: Text('Game Page'),
        ),
      ),
    );
  }
}
