import 'package:flutter/material.dart';
import 'package:health_recipe/helpers/widget_functions.dart';
import 'package:health_recipe/views/result.dart';

import '../helpers/parameter.dart';
import '../helpers/selection.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late List<Parameter> parameters = [
    Parameter(
      typeParameter: 'diet',
      choices: [
        SelectButton(
          text: "balanced",
          avatarText: 'D',
        ),
        SelectButton(
          text: "high-fiber",
          avatarText: 'D',
        ),
        SelectButton(
          text: 'high-protein',
          avatarText: 'D',
        ),
        SelectButton(
          text: "low-carb",
          avatarText: 'D',
        ),
        SelectButton(
          text: "low-fat",
          avatarText: 'D',
        ),
        SelectButton(
          text: "low-sodium",
          avatarText: 'D',
        )
      ],
    ),
    Parameter(
      typeParameter: 'health',
      choices: [
        SelectButton(
          text: "alcohol-cocktail",
          avatarText: 'H',
        ),
        SelectButton(
          text: "alcohol-free",
          avatarText: 'H',
        ),
        SelectButton(
          text: 'celery-free',
          avatarText: 'H',
        ),
        SelectButton(
          text: "crustacean-free",
          avatarText: 'H',
        ),
        SelectButton(
          text: "dairy-free",
          avatarText: 'H',
        ),
        SelectButton(
          text: "DASH",
          avatarText: 'H',
        ),
        SelectButton(text: "egg-free", avatarText: "h"),
        SelectButton(text: "fish-free", avatarText: "H"),
        SelectButton(text: "fodmap-free", avatarText: "H"),
        SelectButton(text: "gluten-free", avatarText: "H"),
        SelectButton(text: "immuno-supportive", avatarText: "H"),
        SelectButton(text: "keto-friendly", avatarText: "H"),
        SelectButton(text: "kidney-friendly", avatarText: "H"),
        SelectButton(text: "kosher", avatarText: "H"),
        SelectButton(text: "low-fat-abs", avatarText: "H"),
        SelectButton(text: "low-potassium", avatarText: "H"),
        SelectButton(text: "low-sugar", avatarText: "H"),
        SelectButton(text: "lupine-free", avatarText: "H"),
        SelectButton(text: "Mediterranean", avatarText: "H"),
        SelectButton(text: "mollusk-free", avatarText: "H"),
        SelectButton(text: "mustard-free", avatarText: "H"),
        SelectButton(text: "no-oil-added", avatarText: "H"),
        SelectButton(text: "paleo", avatarText: "H"),
        SelectButton(text: "peanut-free", avatarText: "H"),
        SelectButton(text: "pork-free", avatarText: "H"),
        SelectButton(text: "red-meat-free", avatarText: "H"),
        SelectButton(text: "sesame-free", avatarText: "H"),
        SelectButton(text: "shellfish-free", avatarText: "H"),
        SelectButton(text: "soy-free", avatarText: "H"),
        SelectButton(text: "sugar-conscious", avatarText: "H"),
        SelectButton(text: "sulfite-free", avatarText: "H"),
        SelectButton(text: "tree-nut-free", avatarText: "H"),
        SelectButton(text: "vegan", avatarText: "H"),
        SelectButton(text: "vegetarian", avatarText: "H"),
        SelectButton(text: "wheat-free", avatarText: "H"),
      ],
    ),
    Parameter(
      typeParameter: 'cuisineType',
      choices: [
        SelectButton(
          text: "American",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Asian",
          avatarText: 'C',
        ),
        SelectButton(
          text: 'British',
          avatarText: 'C',
        ),
        SelectButton(
          text: "Caribbean",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Central Europe",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Chinese",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Eastern Europe",
          avatarText: 'C',
        ),
        SelectButton(
          text: "French",
          avatarText: 'C',
        ),
        SelectButton(
          text: "India",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Italian",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Japanese",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Kosher",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Mediterranean",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Mexican",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Middle Eastern",
          avatarText: 'C',
        ),
        SelectButton(
          text: "Nordic",
          avatarText: 'C',
        ),
        SelectButton(
          text: "South American",
          avatarText: 'C',
        ),
        SelectButton(
          text: "South East Asian",
          avatarText: 'C',
        ),
      ],
    ),
    Parameter(
      typeParameter: 'mealType',
      choices: [
        SelectButton(
          text: "Dinner",
          avatarText: 'M',
        ),
        SelectButton(
          text: "Lunch",
          avatarText: 'M',
        ),
        SelectButton(
          text: 'Lunch',
          avatarText: 'M',
        ),
        SelectButton(
          text: "Snack",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Teatime",
          avatarText: 'M',
        ),
      ],
    ),
    Parameter(
      typeParameter: 'dishType',
      choices: [
        SelectButton(
          text: "Biscuit and cookies",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Bread",
          avatarText: 'D',
        ),
        SelectButton(
          text: 'Cereals',
          avatarText: 'D',
        ),
        SelectButton(
          text: "Condiments and sauces",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Desserts",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Drinks",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Main course",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Pancake",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Preps",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Preserve",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Salad",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Sandwiches",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Side dish",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Soup",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Starter",
          avatarText: 'D',
        ),
        SelectButton(
          text: "Sweets",
          avatarText: 'D',
        ),
      ],
    ),
  ];

  List<String> healths = [], diets = [], cuisineTypes = [], mealTypes = [], dishTypes = [];
  late String recette;

  getParameter() {

    healths.clear(); diets.clear();cuisineTypes.clear() ;mealTypes.clear(); dishTypes.clear();

    recette = _controller.text;

    for (var parameter in parameters) {
      switch (parameter.typeParameter) {
        case "diet":
          {
            for (var choice in parameter.choices) {
              if(choice.isSelected == true){
                diets.add(choice.text);
              }
            }
          }
          break;
        case "health":
          {
            for (var choice in parameter.choices) {
              if(choice.isSelected == true){
                healths.add(choice.text);
              }
            }
          }
          break;
        case "cuisineType":
          {
            for (var choice in parameter.choices) {
              if(choice.isSelected == true){
                cuisineTypes.add(choice.text);
              }
            }
          }
          break;
        case "mealType":
          {
            for (var choice in parameter.choices) {
              if(choice.isSelected == true){
                mealTypes.add(choice.text);
              }
            }
          }
          break;
        case "dishType":
          {
            for (var choice in parameter.choices) {
              if(choice.isSelected == true){
                dishTypes.add(choice.text);
              }
            }
          }
          break;
      }
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Result(healths: healths, diets: diets, cuisineTypes: cuisineTypes, mealTypes: mealTypes, dishTypes: dishTypes, recette: recette)
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTitle(context),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(30)),
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "Recipes",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: IconButton(
                        onPressed: () {
                          getParameter();
                        },
                        icon: const Icon(Icons.search),
                      )),
                  validator: (String? val) => (val == null || val.isEmpty)
                      ? "Please write something"
                      : null),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: parameters,
          )
        ],
      ),
    );
  }
}
