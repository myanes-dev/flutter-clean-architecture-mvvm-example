import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/game_result/game_result_screen.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/history/history_results_screen.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/home_menu/home_menu_screen.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/play/play_screen.dart';

class AppRoute {
  final Widget screen;
  const AppRoute._(this.screen);

  factory AppRoute.home() => AppRoute._(HomeMenuScreen());
  factory AppRoute.play() => AppRoute._(PlayScreen());
  factory AppRoute.gameResults(List<RoundResult> gameResults) => AppRoute._(
        GameResultScreen(
          gameResults: gameResults,
        ),
      );
  factory AppRoute.historyResults() => AppRoute._(HistoryResultsScreen());
}

class AppRouter {
  replace(BuildContext context, AppRoute route) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => route.screen),
    );
  }

  to(BuildContext context, AppRoute route) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => route.screen),
    );
  }

  toNewHome(BuildContext context, AppRoute route) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => route.screen),
      (_) => false,
    );
  }

  back(BuildContext context) {
    Navigator.of(context).pop();
  }

  backHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
