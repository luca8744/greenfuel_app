import '/Models/User.dart';

import 'package:flutter/material.dart';

class User with ChangeNotifier {
  UserItem _item = UserItem(
    Name: 'Name',
    Surname: 'SurName',
    Age: 30,
    Weight: 80,
    TotKcal: 2000,
    CO2xKm: 30,
  );

  UserItem get item {
    return _item;
  }

  void updateUser(UserItem value) {
    _item = value;
    notifyListeners();
  }
}
