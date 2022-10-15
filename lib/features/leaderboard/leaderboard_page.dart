import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/features/leaderboard/bloc/leaderboard_page_bloc.dart';
import 'package:janken_app/features/leaderboard/bloc/leaderboard_page_state.dart';
import 'package:janken_app/main.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  final LeaderboardPageBloc _bloc = getIt();

  late ScrollController _scrollController;

  final ValueNotifier<bool> _showFabNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        // print("ZZLL ${_scrollController.position.}")
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_showFabNotifier.value == true) {
            _showFabNotifier.value = false;
          }
        } else {
          if (_showFabNotifier.value == false) {
            _showFabNotifier.value = true;
          }
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<LeaderboardPageBloc>(
      create: (context) => _bloc..getLeaderboard(),
      child: SafeArea(
        child: Stack(
          children: [
            _leaderboard(),
            _jumpToTopFab(),
          ],
        ),
      ),
    ));
  }

  Widget _leaderboard() {
    return BlocBuilder<LeaderboardPageBloc, LeaderboardPageState>(
      builder: (context, state) {
        final users = state.users;

        if (state.usersDataState.isFailure() && users.isEmpty) {
          //
        }

        if (state.usersDataState.isSuccess()) {
          if (users.isEmpty) {
            // Add empty state here
            return Container();
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: users.length,
            itemBuilder: (context, i) {
              final item = users[i];
              return Text('${item.name} - ${item.elo}');
            },
          );
        }

        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget _jumpToTopFab() {
    // TODO: update so animation starts in center
    // and only disappear when scroll to top
    return Align(
      alignment: Alignment.bottomRight,
      child: ValueListenableBuilder<bool>(
        valueListenable: _showFabNotifier,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOutCubic,
            );
          },
          child: const Icon(Icons.arrow_upward),
        ),
        builder: (BuildContext context, bool shouldShow, Widget? child) {
          return AnimatedContainer(
            height: shouldShow ? 56 : 0,
            width: shouldShow ? 56 : 0,
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 16, right: 16),
            curve: Curves.easeInOut,
            child: child,
          );
        },
      ),
    );
  }
}
