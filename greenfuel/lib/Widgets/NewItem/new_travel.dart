import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Models/Travel.dart';
import '/Provider/Travel_Provider.dart';
import '/Widgets/BuildField/build_NumericField.dart';
import 'package:provider/provider.dart';

class NewTravel extends StatefulWidget {
  NewTravel() {}

  @override
  State<NewTravel> createState() {
    return _NewTravelState();
  }
}

class _NewTravelState extends State<NewTravel> {
  DateTime? selecteddatetime;
  double selectedKm = 0;

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
    selectedKm = double.parse(retText);
  }

  @override
  Widget build(BuildContext context) {
    final _travel = Provider.of<Travel>(context);

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
                BuildNumericField('0', 'Km', _updateData),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  child: Text(selectedKm == 0
                      ? 'No Km!'
                      : 'Weight: ${selectedKm.toString()}'),
                ),
                ElevatedButton(
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                    onPressed: //_submitData
                        () {
                      if (selectedKm == 0) return;
                      final newTx = TravelItem(
                        id: DateTime.now().toString(),
                        datepart: DateFormat('yMd')
                            .format(selecteddatetime as DateTime),
                        date: selecteddatetime as DateTime,
                        Km: selectedKm,
                      );

                      _travel.addTravel(newTx);
                      Navigator.of(context).pop();
                    })
              ],
            ),
          )),
    );
  }
}
