import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/core/widgets/awesome_snackbar.dart';
import 'package:janken_app/data/modules/match/match_consts.dart';
import 'package:janken_app/features/match/bloc/match_page_bloc.dart';
import 'package:janken_app/features/match/bloc/match_page_state.dart';
import 'package:janken_app/main.dart';

class MatchPage extends StatefulWidget {
  MatchPage({Key? key, required this.matchId}) : super(key: key);

  final String matchId;

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  final MatchPageBloc _bloc = getIt();

  @override
  void dispose() {
    _bloc.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<MatchPageBloc>(
          create: (context) => _bloc..initiate(widget.matchId),
          child: BlocConsumer<MatchPageBloc, MatchPageState>(
            listenWhen: (prev, current) {
              return prev.seenResultDataState != current.seenResultDataState ||
                  prev.makeMoveDataState != current.makeMoveDataState ||
                  prev.matchDataState != current.matchDataState ||
                  prev.showResult != current.showResult;
            },
            listener: _blocListener,
            builder: (context, state) {
              if (state.match != null) {
                return _body();
              }

              if (state.matchDataState.isLoading()) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }

              if (state.makeMoveDataState.isFailure()) {
                return const Center(
                  child: Text('Error'),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [
          BlocBuilder<MatchPageBloc, MatchPageState>(
            buildWhen: (prev, current) => prev.userMove != current.userMove,
            builder: (context, state) {
              MatchMove? move;

              if (state.userMove != null) {
                move = state.userMove;
              }

              if (move != null) {
                move = state.match?.getUserMove(_bloc.matchId);
              }

              return Text('Your move: ${move != null ? move.value : ''}');
            },
          ),
          SizedBox(height: 16),
          BlocBuilder<MatchPageBloc, MatchPageState>(
            // TODO: add build when here
            builder: (context, state) {
              final oppMove = state.match?.getOpponentMove(_bloc.userId);
              return Text(
                  'Opponent move: ${oppMove != null ? oppMove.value : ''}');
            },
          ),
          SizedBox(height: 32),
          Text('Make move'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _bloc.makeMove(MatchMove.rock);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Rock'),
                ),
              ),
              InkWell(
                onTap: () {
                  _bloc.makeMove(MatchMove.paper);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Paper'),
                ),
              ),
              InkWell(
                onTap: () {
                  _bloc.makeMove(MatchMove.scissors);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Scissors'),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          InkWell(
            onTap: () {
              _bloc.seenResult();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Seen result'),
            ),
          )
        ],
      ),
    );
  }

  void _blocListener(BuildContext context, MatchPageState state) {
    if (state.makeMoveDataState.isFailure()) {
      context.showErrorSb(message: 'Cannot make move');
      return;
    }

    if (state.matchDataState.isFailure()) {
      context.showErrorSb(message: 'Fetch match data error');
      return;
    }

    if (state.seenResultDataState.isFailure()) {
      context.showErrorSb(message: 'Seen result data error');
      return;
    }

    if (state.showResult) {
      context.showSuccessSb(
        message:
            'Match finished, result = ${state.match?.getResult(_bloc.userId)}',
      );
      return;
    }
  }
}
