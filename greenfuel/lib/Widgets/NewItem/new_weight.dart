import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Models/Weight.dart';
import '/Provider/Weight_Provider.dart';
import '/Widgets/BuildField/build_NumericField.dart';
import 'package:provider/provider.dart';

import '../../Provider/Exercise_Provider.dart';

class NewWeight extends StatefulWidget {
  NewWeight() {}

  @override
  State<NewWeight> createState() {
    return _NewWeightState();
  }
}

class _NewWeightState extends State<NewWeight> {
  DateTime? selecteddatetime;
  double selectedWeight = 0;

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

  void _updateData(String retText) {
    selectedWeight = double.parse(retText);
  }

  @override
  Widget build(BuildContext context) {
    final _weight = Provider.of<Weight>(context);

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
                  height: 40,
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
                BuildNumericField('0', 'Weight', _updateData),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  child: Text(selectedWeight == 0
                      ? 'No Weight!'
                      : 'Weight: ${selectedWeight.toString()}'),
                ),
                ElevatedButton(
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                    onPressed: //_submitData
                        () {
                      if (selectedWeight == 0) return;
                      final newTx = WeightItem(
                        id: DateTime.now().toString(),
                        datepart: DateFormat('yMd')
                            .format(selecteddatetime as DateTime),
                        date: selecteddatetime as DateTime,
                        Weight: selectedWeight,
                      );

                      _weight.addWeight(newTx);
                      Navigator.of(context).pop();
                    })
              ],
            ),
          )),
    );
  }
}
