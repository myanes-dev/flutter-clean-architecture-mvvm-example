import '../models/breed.dart';

class BreedListUsecase {
  Future<List<Breed>?> call() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return [
      Breed(name: "beagle"),
      Breed(name: "boxer"),
      Breed(name: "chihuahua"),
      Breed(name: "dalmatian"),
      Breed(name: "husky"),
    ];
  }
}
