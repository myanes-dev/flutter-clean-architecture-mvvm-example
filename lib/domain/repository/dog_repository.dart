import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';

abstract class DogRespository {
  Future<Result<List<Breed>>> allBreeds();
  Future<Result<Dog>> randomDogFromBreed(Breed breed);
}
