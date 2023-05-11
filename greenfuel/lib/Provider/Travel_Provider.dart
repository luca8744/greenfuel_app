import 'package:flutter/material.dart';
import '../Models/Travel.dart';

import '../Models/Weight.dart';

class Travel with ChangeNotifier {
  List<TravelItem> _items = [];

  List<TravelItem> get items {
    return [..._items];
  }

  TravelItem findById(String Id) {
    return _items.firstWhere((i) => i.id == Id);
  }

  double getTotalKmByDay(String _datepart) {
    double total = 0;

    List<TravelItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      total += element.Km as double;
    });

    return total;
  }

  double getTotalKmById(String _id) {
    double total = 0;

    List<TravelItem> lstitem = _items.where((i) => i.id == _id).toList();

    lstitem.forEach((element) {
      total += element.Km as double;
    });

    return total;
  }

  void addTravel(TravelItem value) {
    _items.add(value);
    notifyListeners();
  }
}
