import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Models/Exercise.dart';
import '/Widgets/BuildField/build_NumericField.dart';
import 'package:provider/provider.dart';

import '../../Provider/Exercise_Provider.dart';

class NewExercise extends StatefulWidget {
  NewExercise() {}

  @override
  State<NewExercise> createState() {
    return _NewExerciseState();
  }
}

class _NewExerciseState extends State<NewExercise> {
  DateTime? selecteddatetime;
  double selectedKCal = 0;

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
    selectedKCal = double.parse(retText);
  }

  @override
  Widget build(BuildContext context) {
    final _exercise = Provider.of<Exercise>(context);

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
                BuildNumericField('0', 'KCal', _updateData),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  child: Text(selectedKCal == 0
                      ? 'No KCal!'
                      : 'KCal: ${selectedKCal.toString()}'),
                ),
                ElevatedButton(
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                    onPressed: //_submitData
                        () {
                      if (selectedKCal == 0) return;
                      final newTx = ExerciseItem(
                        id: DateTime.now().toString(),
                        datepart: DateFormat('yMd')
                            .format(selecteddatetime as DateTime),
                        date: selecteddatetime as DateTime,
                        KCal: selectedKCal,
                      );

                      _exercise.addExercise(newTx);
                      Navigator.of(context).pop();
                    })
              ],
            ),
          )),
    );
  }
}
