import 'package:flutter/material.dart';
import 'package:janken_app/features/game/game_page.dart';
import 'package:janken_app/features/main/main_page.dart';

class AppRouter {
  static const String main = '/';
  static const String game = '/game';

  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
          settings: settings,
        );
      case game:
        return MaterialPageRoute(
          builder: (context) => GamePage(),
          settings: settings,
        );
      default:
        return Container();
    }
  }
}
