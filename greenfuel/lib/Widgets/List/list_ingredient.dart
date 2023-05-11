import 'package:flutter/material.dart';

import '../../data.dart';

class ListIngredient extends StatefulWidget {
  final String ingredientid;

  ListIngredient(this.ingredientid) {}

  @override
  State<ListIngredient> createState() {
    return _ListIngredientState();
  }
}

class _ListIngredientState extends State<ListIngredient> {
  @override
  Widget build(BuildContext context) {
    final _selectedIngredient =
        DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == widget.ingredientid);

    return Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${_selectedIngredient.Name}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('KCal: ${_selectedIngredient.KCalxKg.toString()}'),
                Text('CO2: ${_selectedIngredient.CO2xKg.toString()}'),
                Text('Water: ${_selectedIngredient.WaterxKg.toString()}'),
              ],
            ),
          ],
        ));
  }
}
