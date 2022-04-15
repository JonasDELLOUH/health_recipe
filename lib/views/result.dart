import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_recipe/views/web_recipe_view.dart';

import '../helpers/widget_functions.dart';

import 'package:http/http.dart' as http;

import '../models/recipe_model.dart';

class Result extends StatefulWidget {

  final String recette;
  final List<String> healths, diets, cuisineTypes, mealTypes, dishTypes;


   const Result({Key? key, required this.healths, required this.diets, required this.cuisineTypes, required this.mealTypes, required this.dishTypes, required this.recette}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  String health = "", diet = "", cuisineType = "", mealType = "", dishType = "";
  List<RecipeModel> recipes = [];

  String fillparameter(List<String> parameters, String parameterName){
    String parametersString = "";

    switch(parameterName){
      case "diet" : {
        for (var element in parameters) {
          parametersString +="&diet="+element;
        }
      }
 break;
      case "health" : {
        for (var element in parameters) {
          parametersString +="&health="+element;
        }
      }
      break;
      case "cuisineType" : {
        for (var element in parameters) {
          parametersString +="&cuisineType="+element;
        }
      }
      break;
      case "mealType" : {
        for (var element in parameters) {
          parametersString +="&mealType="+element;
        }
      }
      break;
      case "dishType" : {
        for (var element in parameters) {
          parametersString +="&dishType="+element;
        }
      }
      break;
    }

    return parametersString;
  }

  String lienApi = "";
  getResult() async{
    String url = "https://api.edamam.com/api/recipes/v2?type=public&q=${widget.recette}&app_id=a6e6bcf0&app_key=2458b15329f43378bccb3905ee803781${diet+health+cuisineType+mealType+dishType}";
    lienApi = url;

    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((recipe) {
      RecipeModel recipeModel = RecipeModel(url: recipe['recipe']["url"], image: recipe['recipe']['image'], source: recipe['recipe']['source'], label: recipe['recipe']['label']);
      recipes.add(recipeModel);
    });

    setState(() {

    });

  }

  @override
  void initState() {

    diet = fillparameter(widget.diets, "diet");
    health = fillparameter(widget.healths, "health");
    cuisineType = fillparameter(widget.cuisineTypes, "cuisineType");
    mealType = fillparameter(widget.mealTypes, "mealType");
    dishType = fillparameter(widget.dishTypes, "dishType");
    getResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTitle(context),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
      ),
      body: recipes.isEmpty ? const Center(child: CircularProgressIndicator(),) : Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
          children: recipes.map((recipe) {
            return GridTile(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebRecipeView(url: recipe.url)
                        )
                    );
                  },
                  child: Hero(
                    tag: recipe.image,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(recipe.image, fit: BoxFit.cover,)
                    ),
                  ),
                )
            );
          }).toList(),
        ),
      ),
    );
  }
}

class RecipeTile extends StatelessWidget {
  final String url, image, label, source;
  const RecipeTile({Key? key, required this.url, required this.image, required this.label, required this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebRecipeView(url: url)
            )
        );
      },
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow,
        //margin: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Image.network(
              image,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
