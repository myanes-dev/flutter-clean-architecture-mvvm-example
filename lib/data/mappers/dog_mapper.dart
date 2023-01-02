import 'package:flutter_clean_architecture_2022/data/dto/dog_dto.dart';
import 'package:flutter_clean_architecture_2022/data/entities/dog_entity.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/data/mappers/breed_mapper.dart';

class DogMapper {
  static Dog toDomainFromDto(DogDto dto) {
    // https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg
    final urlParts = dto.url.split("/");
    final indexBreed = urlParts.indexOf('breeds');

    Breed? breed;
    if (indexBreed > -1) {
      final fullBreed = urlParts[indexBreed + 1]; // hound-afghan
      breed = Breed(
        name: fullBreed.split('-').first, // hound
      );
    }

    return Dog(
      id: urlParts.last.replaceAll(".jpg", ''),
      imageUrl: dto.url,
      breed: breed,
    );
  }

  static Dog toDomainFromEntity(DogEntity entity) {
    return Dog(
      id: entity.id,
      imageUrl: entity.imageUrl,
      breed: entity.breed != null
          ? BreedMapper.toDomainFromEntity(entity.breed!)
          : null,
    );
  }

  static DogEntity fromDomainToEntity(Dog domain) {
    final breed = domain.breed != null
        ? BreedMapper.fromDomainToEntity(domain.breed!)
        : null;

    return DogEntity(
      id: domain.id,
      imageUrl: domain.imageUrl,
      breed: breed,
    );
  }
}
