import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/core/config/di.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/home/play_vm.dart';
import 'package:flutter_clean_architecture_2022/ui/widgets/answer_buttons.dart';
import 'package:get/get.dart';

class PlayScreen extends StatelessWidget {
  PlayScreen({Key? key}) : super(key: key);

  final PlayViewModel _model = getIt();

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐶 Dogs Games 🐶'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: themeData.colorScheme.background,
      ),
      body: GetX<PlayViewModel>(
        init: _model,
        builder: (model) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (model.currentRound != null) {
            final round = model.currentRound!;
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
                      'What its breed?',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: Dimens.MARGIN_M),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: model.roundStatus == RoundStatus.PLAYING
                            ? AnswerButtons(
                                key: const Key('AnswerButtons_success'),
                                round: round,
                                onAnswer: model.onAnswer,
                              )
                            : AnswerButtons(
                                key: const Key('AnswerButtons_error'),
                                round: round,
                                onAnswer: model.onAnswer,
                                answer: model.currentRoundResult?.answer,
                              ),
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
