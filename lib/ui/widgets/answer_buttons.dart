import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:get/get.dart';

class AnswerButtons extends StatelessWidget {
  const AnswerButtons({
    Key? key,
    required this.round,
    this.onAnswer,
    this.answer,
  }) : super(key: key);

  final Round round;
  final ValueChanged<Breed>? onAnswer;
  final Breed? answer;

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    final isAnswered = answer != null;
    return Column(
      children: round.answers
          .map(
            (breed) => Flexible(
              child: Container(
                margin: const EdgeInsets.only(bottom: Dimens.MARGIN_S),
                decoration: BoxDecoration(
                  color: isAnswered && breed.name == round.dog.breed?.name
                      ? Colors.green
                      : isAnswered && breed.name == answer?.name
                          ? Colors.red
                          : themeData.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () => onAnswer?.call(breed),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        breed.name.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
