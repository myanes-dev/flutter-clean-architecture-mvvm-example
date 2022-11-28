import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';

class Dog {
  final String id;
  final String imageUrl;
  final Breed? breed;

  Dog({
    required this.id,
    required this.imageUrl,
    this.breed,
  });
}
