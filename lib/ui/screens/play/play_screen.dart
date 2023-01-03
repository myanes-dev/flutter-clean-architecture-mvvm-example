import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/core/config/di.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:flutter_clean_architecture_2022/ui/router/router.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/play/play_vm.dart';
import 'package:flutter_clean_architecture_2022/ui/widgets/answer_buttons.dart';
import 'package:get/get.dart';

class PlayScreen extends StatelessWidget {
  PlayScreen({
    Key? key,
    AppRouter? router,
  })  : _router = router ?? getIt(),
        super(key: key);

  final AppRouter _router;
  final PlayViewModel _model = getIt();

  PlayViewModel _init(BuildContext context) {
    ever(_model.viewEvents, (event) {
      switch (event) {
        case PlayViewEvent.navigateToResultPage:
          _router.replace(
            context,
            AppRoute.gameResults(_model.gameState.roundsResults),
          );
          break;
        default:
      }
    });

    return _model;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐶 Dogs Games 🐶'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: themeData.colorScheme.background,
        foregroundColor: themeData.colorScheme.onBackground,
      ),
      body: GetX<PlayViewModel>(
        init: _init(context),
        builder: (model) {
          if (model.gameState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (model.gameState.currentRound != null) {
            final round = model.gameState.currentRound!;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.MARGIN_S,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.MARGIN_S,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: Dimens.MARGIN_M),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          round.dog.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimens.MARGIN_L),
                    const Text(
                      'This dog is a...',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: Dimens.MARGIN_M),
                    Expanded(
                      child: AnswerButtons(
                        round: round,
                        onAnswer: model.onAnswer,
                      ),
                    ),
                    const SizedBox(height: Dimens.MARGIN_M),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
