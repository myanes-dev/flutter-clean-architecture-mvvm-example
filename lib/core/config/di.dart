import 'package:flutter_clean_architecture_2022/data/database/hive/hive_client.dart';
import 'package:flutter_clean_architecture_2022/data/network/http_servie.dart';
import 'package:flutter_clean_architecture_2022/data/repository/http_dog_repo.dart';
import 'package:flutter_clean_architecture_2022/data/repository/local_game_repo.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/dog_repository.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/game_repository.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/breed_list_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/dog_random_breed_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_builder_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_history_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_remove_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_save_usecase.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/history/history_results_bloc.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/play/play_vm.dart';
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
  getIt.registerLazySingleton<HiveClient>(() => HiveClient());

  // Repository
  getIt.registerSingleton<DogRespository>(HttpDogRepo(apiService: getIt()));
  getIt.registerLazySingleton<GameRespository>(
    () => LocalGameRepo(getIt<HiveClient>()),
  );
}

void _domain() {
  // UseCases
  getIt.registerFactory<DogRandomBreedUsecase>(
    () => DogRandomBreedUsecase(
      getIt(),
    ),
  );
  getIt.registerFactory<BreedListUsecase>(
    () => BreedListUsecase(
      getIt(),
    ),
  );
  getIt.registerFactory<GameCreatorUsecase>(
    () => GameCreatorUsecase(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerFactory<GameSaveUseCase>(
    () => GameSaveUseCase(
      gameRespository: getIt(),
    ),
  );
  getIt.registerFactory<GameRemoveUseCase>(
    () => GameRemoveUseCase(
      gameRespository: getIt(),
    ),
  );
  getIt.registerFactory<GameHistoryUseCase>(
    () => GameHistoryUseCase(
      gameRespository: getIt(),
    ),
  );
}

void _view() {
  // ViewModels
  getIt.registerFactory<PlayViewModel>(
    () => PlayViewModel(
      gameCreatorUsecase: getIt(),
      gameSaveUseCase: getIt(),
    ),
  );
  getIt.registerFactory<HistoryResultsBloc>(
    () => HistoryResultsBloc(
      getIt(),
      getIt(),
    ),
  );
}
