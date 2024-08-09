import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_list/models/recipe.dart';

class RecipeApi {

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {'limit': '24', 'start': '0'});
    final response = await http.get(uri, headers: {
      'x-rapidapi-key': '586d9a39e5msh8b560305c8df378p117b33jsnb06add084dde',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
    });
    Map? data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data?['feed'] ) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
