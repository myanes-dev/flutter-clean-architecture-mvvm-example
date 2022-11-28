import 'package:flutter_clean_architecture_2022/domain/usecasaes/breed_list_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_builder_usecase.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/home/play_vm.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> initializeDI() async {
  _domain();
  _view();
}

void _domain() {
  getIt.registerFactory<BreedListUsecase>(() => BreedListUsecase());
  getIt.registerFactory<GameCreatorUsecase>(
    () => GameCreatorUsecase(
      breedListUsecase: getIt(),
    ),
  );
}

void _view() {
  getIt.registerFactory<PlayViewModel>(
    () => PlayViewModel(
      gameCreatorUsecase: getIt(),
    ),
  );
}
