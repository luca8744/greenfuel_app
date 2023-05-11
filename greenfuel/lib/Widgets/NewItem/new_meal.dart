import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Models/Meal.dart';
import '../../Provider/Meal_Provider.dart';

class NewMeal extends StatefulWidget {
  NewMeal() {}

  @override
  State<NewMeal> createState() {
    return _NewMealState();
  }
}

class _NewMealState extends State<NewMeal> {
  DateTime? selecteddatetime;
  MealType selectedtype = MealType.Extra;

  List<DropdownMenuItem<MealType>> get dropdownItems {
    List<DropdownMenuItem<MealType>> menuItems = [
      DropdownMenuItem(child: Text("Extra"), value: MealType.Extra),
      DropdownMenuItem(child: Text("Breakfast"), value: MealType.Breakfast),
      DropdownMenuItem(
          child: Text("MorningBreak"), value: MealType.MorningBreak),
      DropdownMenuItem(child: Text("Lunch"), value: MealType.Lunch),
      DropdownMenuItem(
          child: Text("AfternoonBreak"), value: MealType.AfternoonBreak),
      DropdownMenuItem(child: Text("Dinner"), value: MealType.Dinner),
    ];
    return menuItems;
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 50)),
      lastDate: DateTime.now().add(Duration(days: 50)),
    ).then((pickedDate) {
      print(DateFormat.yMd().format(pickedDate as DateTime));

      if (pickedDate == null) return;

      setState(() {
        selecteddatetime = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _meals = Provider.of<Meal>(context);

    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 20,
                  child: Row(children: [
                    Expanded(
                      child: Text(selecteddatetime == null
                          ? 'No Date Chosen!'
                          : 'Selected Date: ${DateFormat.yMd().format(selecteddatetime as DateTime)}'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        child: Text(
                          "Choose Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => _presentDatePicker())
                  ]),
                ),
                DropdownButton(
                  value: selectedtype,
                  items: dropdownItems,
                  onChanged: (MealType? newValue) {
                    setState(() {
                      selectedtype = newValue!;
                    });
                  },
                ),
                ElevatedButton(
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                    onPressed: //_submitData
                        () {
                      final newTx = MealItem(
                        id: DateTime.now().toString(),
                        datepart: DateFormat('yMd')
                            .format(selecteddatetime as DateTime),
                        date: selecteddatetime as DateTime,
                        type: selectedtype,
                      );

                      _meals.addMeal(newTx);
                      Navigator.of(context).pop();
                    })
              ],
            ),
          )),
    );
  }
}
