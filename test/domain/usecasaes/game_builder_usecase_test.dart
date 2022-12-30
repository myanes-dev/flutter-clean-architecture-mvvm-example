import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/breed_list_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/dog_random_breed_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_builder_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test_data/breed_data.dart';
import 'game_builder_usecase_test.mocks.dart';

@GenerateMocks([BreedListUsecase, DogRandomBreedUsecase])
final _breedListUsecase = MockBreedListUsecase();
final _dogRandomBreedUsecase = MockDogRandomBreedUsecase();
late final GameCreatorUsecase _gameCreator;
void main() {
  setUpAll(() {
    _gameCreator = GameCreatorUsecase(
      _breedListUsecase,
      _dogRandomBreedUsecase,
    );
  });

  test('should crete a game with 2 rounds', () async {
    when(_breedListUsecase.call()).thenAnswer(
      (realInvocation) async =>
          Result(true, value: BreedTestData.validBreedList()),
    );
    when(
      _dogRandomBreedUsecase.call(
        breed: anyNamed('breed'),
      ),
    ).thenAnswer(
      (realInvocation) async => Result(
        true,
        value: Dog(id: "id", imageUrl: "imageUrl", breed: Breed(name: "breed")),
      ),
    );

    final result = await _gameCreator(numOfRounds: 2);

    expect(result.success, true);
    expect(result.value!.length, 2);
  });

  test('should return error when breedlist has errors', () async {
    when(_breedListUsecase.call()).thenAnswer(
      (realInvocation) async => Result(false),
    );

    final result = await _gameCreator(numOfRounds: 2);

    expect(result.success, false);
  });

  test('should return error when randomDog has errors', () async {
    when(_breedListUsecase.call()).thenAnswer(
      (realInvocation) async =>
          Result(true, value: BreedTestData.validBreedList()),
    );
    when(
      _dogRandomBreedUsecase.call(
        breed: anyNamed('breed'),
      ),
    ).thenAnswer(
      (realInvocation) async => Result(false),
    );

    final result = await _gameCreator(numOfRounds: 2);

    expect(result.success, false);
  });
}
