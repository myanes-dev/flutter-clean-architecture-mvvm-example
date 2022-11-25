class Dog {
  final String id;
  final String imageUrl;
  final String? breed;

  Dog({
    required this.id,
    required this.imageUrl,
    this.breed,
  });
}
