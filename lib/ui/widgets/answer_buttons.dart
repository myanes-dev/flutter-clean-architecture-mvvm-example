import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:get/get.dart';

class AnswerButtons extends StatefulWidget {
  const AnswerButtons({
    Key? key,
    required this.round,
    this.onAnswer,
  }) : super(key: key);

  final Round round;
  final ValueChanged<Breed>? onAnswer;

  @override
  State<AnswerButtons> createState() => _AnswerButtonsState();
}

class _AnswerButtonsState extends State<AnswerButtons> {
  Breed? answer;

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    final isAnswered = answer != null;
    const Duration answerAnimationDuration = Duration(milliseconds: 200);
    const Duration afterAnsweDelay = Duration(milliseconds: 600);
    return Column(
      children: widget.round.answers
          .map(
            (breed) => Flexible(
              child: AnimatedContainer(
                margin: const EdgeInsets.only(bottom: Dimens.MARGIN_S),
                decoration: BoxDecoration(
                  color:
                      isAnswered && breed.name == widget.round.dog.breed?.name
                          ? Colors.green
                          : isAnswered && breed.name == answer?.name
                              ? Colors.red
                              : themeData.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                duration: answerAnimationDuration,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      answer = breed;
                    });
                    Future.delayed(
                      afterAnsweDelay,
                      () => widget.onAnswer?.call(breed),
                    );
                  },
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
