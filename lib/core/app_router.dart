import 'package:flutter/material.dart';
import 'package:janken_app/features/auth/login_register_page.dart';
import 'package:janken_app/features/game/game_page.dart';
import 'package:janken_app/features/main/main_page.dart';
import 'package:janken_app/features/match/match_page.dart';

class AppRouter {
  static const String loginRegister = '/login-register';
  static const String main = '/main';
  static const String game = '/game';
  static const String match = '/match';

  static const initialRoute = loginRegister;

  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRegister:
        return MaterialPageRoute(
          builder: (context) => const LoginRegisterPage(),
          settings: settings,
        );
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
      case match:
        final matchId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MatchPage(matchId: matchId),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('404 Page')),
          ),
          settings: settings,
        );
    }
  }
}
