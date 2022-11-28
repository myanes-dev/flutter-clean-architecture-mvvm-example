import 'package:flutter_clean_architecture_2022/data/network/http_servie.dart';
import 'package:flutter_clean_architecture_2022/data/repository/http_dog_repo.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/dog_repository.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/breed_list_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/dog_random_breed_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_builder_usecase.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/home/play_vm.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void initializeDI() {
  _data();
  _domain();
  _view();
}

void _data() {
  // Services
  getIt.registerSingleton<HttpService>(HttpService());

  // Repository
  getIt.registerSingleton<DogRespository>(HttpDogRepo(apiService: getIt()));
}

void _domain() {
  // UseCases
  getIt.registerFactory<DogRandomBreedUsecase>(
    () => DogRandomBreedUsecase(
      dogRespository: getIt(),
    ),
  );
  getIt.registerFactory<BreedListUsecase>(
    () => BreedListUsecase(
      dogRespository: getIt(),
    ),
  );
  getIt.registerFactory<GameCreatorUsecase>(
    () => GameCreatorUsecase(
      breedListUsecase: getIt(),
      dogRandomBreedUsecase: getIt(),
    ),
  );
}

void _view() {
  // ViewModels
  getIt.registerFactory<PlayViewModel>(
    () => PlayViewModel(
      gameCreatorUsecase: getIt(),
    ),
  );
}
