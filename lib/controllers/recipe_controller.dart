import 'package:get/get.dart';

import '../models/recipe_model.dart';

class RecipeController extends GetxController {
  var recipes = <Recipe>[
    Recipe(name: 'Rooti ', description: '25', image: "assets/images/food.jpg"),
    Recipe(name: 'Dal', description: '15', image: "assets/images/food.jpg"),
    Recipe(name: 'Bhat', description: '20', image: "assets/images/food.jpg"),
  ].obs;

  void addRecipe(Recipe recipe) {
    recipes.add(recipe);
  }
}
