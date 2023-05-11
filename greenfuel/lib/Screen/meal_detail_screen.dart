import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Widgets/List/list_ingredient.dart';
import 'package:provider/provider.dart';
import '../Models/Meal.dart';
import '../Provider/Meal_Provider.dart';
import '../Widgets/NewItem/new_ingredient.dart';
import '../data.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-deatil';
  final List<MealItem> _availableMeals;

  MealDetailScreen(this._availableMeals) {}

  @override
  State<MealDetailScreen> createState() {
    return _MealDetailScreenState();
  }
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  void _addnewingredients(
      BuildContext ctx, MealItem _selectedMeal, String txingredientid) {
    final _meals = Provider.of<Meal>(ctx, listen: false);

    _meals.updateMeal(_selectedMeal, txingredientid);
  }

  void _showaddpopup(BuildContext ctx, MealItem _selectedMeal) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewIngredient(_addnewingredients, _selectedMeal));
        });
  }

  @override
  Widget build(BuildContext context) {
    final _meals = Provider.of<Meal>(context);

    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final _mealid = routeArgs; //routeArgs.mealid;
    //final _updatetx = routeArgs.updatelist;
    final _selectedMeal = _meals.findById(_mealid);
    //widget._availableMeals.firstWhere((meal) => meal.id == _mealid);

    //final _cart = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${DateFormat('y-M-d').format(_selectedMeal.date as DateTime)} - ${TYPE_INGREDIENTS[_selectedMeal.type.index]}',
              ),
              IconButton(
                onPressed: () => _showaddpopup(context, _selectedMeal),
                icon: Icon(Icons.add),
                color: Colors.white,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: _selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                        child: Card(
                          color: Theme.of(context).canvasColor,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: _selectedMeal.ingredients.length > 0
                                  ? ListIngredient(
                                      _selectedMeal.ingredients[index])
                                  : Text('Select Ingredient')),
                        ),
                        onTap: null)),
              ),
            ],
          ),
        ));
  }
}
