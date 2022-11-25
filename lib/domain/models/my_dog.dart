class MyDog {
  final String id;
  final String name;
  final String imageUrl;
  final String? breed;

  MyDog({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.breed,
  });
}
