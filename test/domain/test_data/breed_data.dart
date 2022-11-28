import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';

class BreedTestData {
  static List<Breed> validBreedList() {
    return [
      Breed(name: 'hound'),
      Breed(name: 'pitbull'),
      Breed(name: 'labrador'),
      Breed(name: 'golden'),
    ];
  }
}
