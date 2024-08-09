import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipe_list/models/recipe.api.dart';
import 'package:recipe_list/models/recipe.dart';
import 'package:recipe_list/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
     _recipes = (await RecipeApi.getRecipe())  ;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 10,
              ),
              Text("Food Recipe"),
            ],
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images, cookTime:_recipes[index].totalTime.toString() , );
                }));
  }
}
