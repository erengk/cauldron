import 'package:cauldron/screens/user_screens/recipe_thumbnail.dart';
import 'package:flutter/material.dart';

import '../../models/simple_recipe.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipesGridView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
    left: 16,
    right: 16,
    top: 16,),
    child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index){
      final simpleRecipe = recipes[index];
      return RecipeThumbnail(recipe: simpleRecipe);
    },),
    );
    }
}
