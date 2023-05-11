import 'package:flutter/material.dart';

import '../Models/Weight.dart';

class Weight with ChangeNotifier {
  List<WeightItem> _items = [];

  List<WeightItem> get items {
    return [..._items];
  }

  WeightItem findById(String Id) {
    return _items.firstWhere((i) => i.id == Id);
  }

  double getTotalWeightByDay(String _datepart) {
    double total = 0;

    List<WeightItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      total += element.Weight as double;
    });

    return total;
  }

  double getTotalWeightById(String _id) {
    double total = 0;

    List<WeightItem> lstitem = _items.where((i) => i.id == _id).toList();

    lstitem.forEach((element) {
      total += element.Weight as double;
    });

    return total;
  }

  void addWeight(WeightItem value) {
    _items.add(value);
    notifyListeners();
  }
}
