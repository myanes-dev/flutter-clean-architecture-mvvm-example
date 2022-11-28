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
}

enum RoundStatus {
  COMPLETED,
  PLAYING,
}
