import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/core/config/di.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:flutter_clean_architecture_2022/ui/router/router.dart';

class GameResultScreen extends StatelessWidget {
  GameResultScreen({
    Key? key,
    required this.gameResults,
    AppRouter? router,
  })  : _router = router ?? getIt(),
        super(key: key);

  final AppRouter _router;
  final List<RoundResult> gameResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'RESULTS',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: Dimens.MARGIN_SM),
            Text(
              '${gameResults.answersOKcount} / ${gameResults.length}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: Dimens.MARGIN_XL),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                child: const Text(
                  'PLAY AGAIN!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  _router.replace(context, AppRoute.play());
                },
              ),
            ),
            const SizedBox(height: Dimens.MARGIN_M),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                child: const Text(
                  'BACK TO MENU',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  _router.backHome(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
