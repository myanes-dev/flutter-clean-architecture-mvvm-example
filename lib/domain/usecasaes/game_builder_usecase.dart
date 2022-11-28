import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/breed_list_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/dog_random_breed_usecase.dart';
import 'dart:math';

class GameCreatorUsecase {
  final BreedListUsecase breedListUsecase;
  final DogRandomBreedUsecase dogRandomBreedUsecase;

  GameCreatorUsecase({
    required this.breedListUsecase,
    required this.dogRandomBreedUsecase,
  });

  Future<Result<List<Round>>> call({
    required int numOfRounds,
  }) async {
    // All breeds
    final breedListResult = await breedListUsecase();
    if (!breedListResult.success) return Result(false);

    final List<Breed> breedList = breedListResult.value!;
    final radomBreeds = [];
    for (var i = 0; i < numOfRounds; i++) {
      final Random random = Random();
      radomBreeds.add(breedList[random.nextInt(breedList.length)]);
    }

    // Fetch one random dog for each breed
    final List<Future<Result<Dog>>> futures = radomBreeds
        .map((breed) => dogRandomBreedUsecase(breed: breed))
        .toList();
    final dogsResults = await Future.wait(futures);

    final areAllSuccess = dogsResults.fold<bool>(
        true, (previousValue, element) => previousValue && element.success);
    if (!areAllSuccess) return Result(false);

    // Rounds withs 4 answers for each dog
    final rounds = dogsResults.map(
      (e) {
        // Generate random answer for each dog
        final dog = e.value!;
        final List<Breed> randomAnswers = [dog.breed!];
        for (var i = 0; i < 3; i++) {
          final Random random = Random();
          randomAnswers.add(breedList[random.nextInt(breedList.length)]);
        }
        randomAnswers.sort(((a, b) => a.name.compareTo(b.name)));
        return Round(dog: dog, answers: randomAnswers);
      },
    ).toList();

    return Result(true, value: rounds);
  }
}
