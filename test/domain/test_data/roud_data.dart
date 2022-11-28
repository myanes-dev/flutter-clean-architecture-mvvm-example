import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';

class RoundTestData {
  static List<Round> twoValidGameRounds() {
    return [
      Round(
        dog: Dog(
          id: 'n02099712_3698',
          breed: Breed(name: 'labrador'),
          imageUrl: 'https://images.dog.ceo/breeds/labrador/n02099712_3698.jpg',
        ),
        answers: [
          Breed(name: 'hound'),
          Breed(name: 'pitbull'),
          Breed(name: 'labrador'),
          Breed(name: 'golden'),
        ],
      ),
      Round(
        dog: Dog(
          id: 'n02089867_1310',
          breed: Breed(name: 'hound'),
          imageUrl:
              'https://images.dog.ceo/breeds/hound-walker/n02089867_1310.jpg',
        ),
        answers: [
          Breed(name: 'hound'),
          Breed(name: 'pitbull'),
          Breed(name: 'labrador'),
          Breed(name: 'golden'),
        ],
      ),
    ];
  }
}
