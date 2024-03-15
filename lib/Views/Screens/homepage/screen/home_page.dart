import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:more_chat/Views/Screens/recipe_page/like_page.dart';
import '../../../../controllers/recipe_controller.dart';
import '../../../../models/recipe_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(RecipeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Gujju Dhaba'),
      ),
      body: GetX<RecipeController>(
        init: RecipeController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.recipes.length,
            itemBuilder: (context, index) {
              var recipe = controller.recipes[index];
              return Container(
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: ListTile(
                  leading: Image.asset(recipe.image),
                  title: Text(recipe.name),
                  subtitle: Text(recipe.description),
                  onTap: () {
                    Get.to(recipeLikedPage());
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddRecipeDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddRecipeDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Recipe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.find<RecipeController>().addRecipe(
                  Recipe(
                    name: nameController.text,
                    description: descriptionController.text,
                    image: "",
                  ),
                );
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
