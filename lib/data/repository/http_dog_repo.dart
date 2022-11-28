import 'dart:convert';

import 'package:flutter_clean_architecture_2022/data/dto/dog_dto.dart';
import 'package:flutter_clean_architecture_2022/data/mappers/dog_mapper.dart';
import 'package:flutter_clean_architecture_2022/data/network/http_servie.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/dog_repository.dart';

class HttpDogRepo implements DogRespository {
  final HttpService apiService;

  HttpDogRepo({required this.apiService});

  @override
  Future<Result<List<Breed>>> allBreeds() async {
    try {
      final response = await apiService.fetchAllBreeds();
      if (response.statusCode != 200) return Result(false);

      final Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;

      final breedsRaw = json['message'] as Map<String, dynamic>;

      final List<Breed> breedList =
          breedsRaw.keys.map((e) => Breed(name: e)).toList();

      return Result(true, value: breedList);
    } catch (e) {
      return Result(false);
    }
  }

  @override
  Future<Result<Dog>> randomDogFromBreed(Breed breed) async {
    try {
      final response = await apiService.fetchRandomDogByBreed(breed.name);
      if (response.statusCode != 200) return Result(false);

      final Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;

      return Result(true, value: DogDto(url: json['message']).toDomain());
    } catch (e) {
      return Result(false);
    }
  }
}
