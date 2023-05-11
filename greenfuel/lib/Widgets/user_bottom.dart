import 'package:flutter/material.dart';

import '../data.dart';

class UserBottom extends StatelessWidget {
  UserBottom();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Ingredient',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Tot: ${DUMMY_INGREDIENTS.length}'),
        Text(
            'Max KCal: ${DUMMY_INGREDIENTS.reduce((value, element) => value.KCalxKg > element.KCalxKg ? value : element).Name}'),
        Text(
            'Max CO2: ${DUMMY_INGREDIENTS.reduce((value, element) => value.CO2xKg > element.CO2xKg ? value : element).Name}'),
        Text(
            'Max H2O: ${DUMMY_INGREDIENTS.reduce((value, element) => value.WaterxKg > element.WaterxKg ? value : element).Name}'),
        Text(
            'Max Protein: ${DUMMY_INGREDIENTS.reduce((value, element) => value.ProteinxKg > element.ProteinxKg ? value : element).Name}'),
        Text(
            'Max Fat: ${DUMMY_INGREDIENTS.reduce((value, element) => value.FatxKg > element.FatxKg ? value : element).Name}'),
        Text(
            'Max Sugar: ${DUMMY_INGREDIENTS.reduce((value, element) => value.SugarxKg > element.SugarxKg ? value : element).Name}'),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
