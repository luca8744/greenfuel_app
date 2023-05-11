import 'package:flutter/material.dart';
import '../data.dart';
import '../Widgets/ingredient_details.dart';

class IngredientScreen extends StatelessWidget {
  static const routeName = '/ingredient-list';

  IngredientScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ingredients',
              )
            ],
          ),
        ),
        body: GestureDetector(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: DUMMY_INGREDIENTS.length,
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).canvasColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: IngredientDetails(
                              DUMMY_INGREDIENTS[index].Name,
                              DUMMY_INGREDIENTS[index].KCalxKg,
                              DUMMY_INGREDIENTS[index].CO2xKg,
                              DUMMY_INGREDIENTS[index].WaterxKg,
                              Theme.of(context).splashColor),
                        ),
                      )),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ));
  }
}
