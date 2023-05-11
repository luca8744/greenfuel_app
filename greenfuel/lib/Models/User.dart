import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class UserItem {
  final String Name;
  final String Surname;
  final int Age;
  final double Weight;
  final double TotKcal;
  final double CO2xKm;

  const UserItem({
    required this.Name,
    required this.Surname,
    required this.Age,
    required this.Weight,
    required this.TotKcal,
    required this.CO2xKm,
  });
}
