import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/dog_repository.dart';

class DogRandomBreedUsecase {
  final DogRespository dogRespository;
  DogRandomBreedUsecase({
    required this.dogRespository,
  });

  Future<Result<Dog>> call({required Breed breed}) =>
      dogRespository.randomDogFromBreed(breed);
}
