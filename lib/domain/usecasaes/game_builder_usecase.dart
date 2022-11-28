import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/breed_list_usecase.dart';
import 'dart:math';

class GameCreatorUsecase {
  final BreedListUsecase breedListUsecase;

  GameCreatorUsecase({required this.breedListUsecase});

  Future<List<Round>?> call({
    required int numOfRounds,
  }) async {
    final breedList = await breedListUsecase();
    if (breedList == null) return null;

    final radomBreeds = [];
    for (var i = 0; i < numOfRounds; i++) {
      final Random random = Random();
      radomBreeds.add(breedList[random.nextInt(breedList.length)]);
    }

    // TODO: fetch one random dog for each breed

    // TODO: generate random answer for each dog

    await Future.delayed(const Duration(milliseconds: 2000));
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
