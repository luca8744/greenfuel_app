import 'package:flutter/material.dart';
import '../Models/Exercise.dart';

class Exercise with ChangeNotifier {
  List<ExerciseItem> _items = [];

  List<ExerciseItem> get items {
    return [..._items];
  }

  ExerciseItem findById(String Id) {
    return _items.firstWhere((i) => i.id == Id);
  }

  double getTotalKCalByDay(String _datepart) {
    double total = 0;

    List<ExerciseItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      total += element.KCal as double;
    });

    return total;
  }

  double getTotalKCalById(String _id) {
    double total = 0;

    List<ExerciseItem> lstitem = _items.where((i) => i.id == _id).toList();

    lstitem.forEach((element) {
      total += element.KCal as double;
    });

    return total;
  }

  void addExercise(ExerciseItem value) {
    _items.add(value);
    notifyListeners();
  }
}
