import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/play/play_screen.dart';
import 'package:get/get.dart';

class GameResultScreen extends StatelessWidget {
  const GameResultScreen({
    Key? key,
    required this.gameResults,
  }) : super(key: key);

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
            CupertinoButton.filled(
              child: const Text(
                'PLAY AGAIN!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                print('TODO: start new game');
                Get.off(
                  () => PlayScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
