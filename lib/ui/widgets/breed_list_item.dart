import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:get/get.dart';

class BreedListItem extends StatelessWidget {
  const BreedListItem({
    Key? key,
    required this.breed,
  }) : super(key: key);

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: const EdgeInsets.all(Dimens.MARGIN_S),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.surface,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 48,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                child: Image.network(
                  'https://images.dog.ceo/breeds/labrador/n02099712_3698.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: Dimens.MARGIN_S),
          Expanded(
            child: Text(
              breed.name,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
