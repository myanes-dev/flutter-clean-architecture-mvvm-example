import 'package:flutter_clean_architecture_2022/data/dto/dog_dto.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';

extension DogMapper on DogDto {
  Dog toDomain() {
    // https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg
    final urlParts = url.split("/");
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
      imageUrl: url,
      breed: breed,
    );
  }
}
