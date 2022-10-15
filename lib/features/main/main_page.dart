import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:janken_app/core/app_router.dart';
import 'package:janken_app/features/home/home_page.dart';
import 'package:janken_app/features/leaderboard/leaderboard_page.dart';
import 'package:janken_app/features/match_history/match_history_page.dart';
import 'package:janken_app/features/stats/stats_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _activeIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    if (_activeIndex == index) return;
    _activeIndex = index;

    setState(() {
      _pageController.jumpToPage(_activeIndex);
    });
  }

  void _onPageChanged(int pageIndex) {
    if (pageIndex == _activeIndex) return;
    setState(() {
      _activeIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        allowImplicitScrolling: false,
        children: const [
          HomePage(),
          LeaderboardPage(),
          MatchHistoryPage(),
          StatsPage(),
        ],
      ), //destination screen
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRouter.game);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.home,
          Icons.leaderboard,
          Icons.history,
          Icons.account_circle_outlined
        ],
        activeIndex: _activeIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: _onTap,
        //other params
      ),
    );
  }
}
