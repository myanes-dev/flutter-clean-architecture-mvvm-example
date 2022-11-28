import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';

class Round {
  final Dog dog;
  final List<Breed> answers;
  Round({
    required this.dog,
    required this.answers,
  });
}

class RoundResult {
  final Round round;
  final Breed answer;
  RoundResult({
    required this.round,
    required this.answer,
  });

  bool get isSuccess {
    return answer.name == round.dog.breed?.name;
  }
}

extension GameResultsExtend on List<RoundResult> {
  int get answersOKcount {
    return fold(
      0,
      (previousValue, element) {
        return element.isSuccess ? previousValue + 1 : previousValue;
      },
    );
  }
}

enum RoundStatus {
  COMPLETED,
  PLAYING,
}
