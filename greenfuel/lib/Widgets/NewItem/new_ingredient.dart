import 'package:flutter/material.dart';

import '../../Models/Meal.dart';
import '../../data.dart';

class NewIngredient extends StatefulWidget {
  final Function _addtx;
  final MealItem _selecteditem;

  NewIngredient(this._addtx, this._selecteditem) {}

  @override
  State<NewIngredient> createState() {
    return _NewIngredientState();
  }
}

class _NewIngredientState extends State<NewIngredient> {
  String selectedtype = DUMMY_INGREDIENTS[0].id;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[0].Name),
          value: DUMMY_INGREDIENTS[0].id),
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[1].Name),
          value: DUMMY_INGREDIENTS[1].id),
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[2].Name),
          value: DUMMY_INGREDIENTS[2].id),
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[3].Name),
          value: DUMMY_INGREDIENTS[3].id),
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[4].Name),
          value: DUMMY_INGREDIENTS[4].id),
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[5].Name),
          value: DUMMY_INGREDIENTS[5].id),
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[6].Name),
          value: DUMMY_INGREDIENTS[6].id),
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[7].Name),
          value: DUMMY_INGREDIENTS[7].id),
      DropdownMenuItem(
          child: Text(DUMMY_INGREDIENTS[8].Name),
          value: DUMMY_INGREDIENTS[8].id),
    ];
    return menuItems;
  }

  void _submitData() {
    widget._addtx(context, widget._selecteditem, selectedtype);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DropdownButton(
                  value: selectedtype,
                  items: dropdownItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedtype = newValue!;
                    });
                  },
                ),
                ElevatedButton(
                    child: Text('Add Ingredient',
                        style: TextStyle(color: Colors.white)),
                    onPressed: _submitData)
              ],
            ),
          )),
    );
  }
}
