import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/dog_repository.dart';

import '../models/breed.dart';

class BreedListUsecase {
  final DogRespository dogRespository;
  BreedListUsecase({
    required this.dogRespository,
  });

  Future<Result<List<Breed>>> call() => dogRespository.allBreeds();
}
