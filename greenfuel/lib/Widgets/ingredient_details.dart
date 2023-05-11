import 'package:flutter/material.dart';

class IngredientDetails extends StatelessWidget {
  final String _name;
  final double _KCalxKG;
  final double _CO2xKg;
  final double _WaterxKG;
  final Color _color;

  IngredientDetails(
      this._name, this._KCalxKG, this._CO2xKg, this._WaterxKG, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${_name}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('KCal: ${_KCalxKG.toString()}'),
                Text('CO2: ${_CO2xKg.toString()}'),
                Text('Water: ${_WaterxKG.toString()}'),
              ],
            ),
          ],
        ));
  }
}
