import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Ingredient {
  final String id;
  final String Name;
  final String Type;
  final double KCalxKg;
  final double CO2xKg;
  final double WaterxKg;
  final double ProteinxKg;
  final double FatxKg;
  final double SugarxKg;

  const Ingredient({
    required this.id,
    required this.Name,
    required this.Type,
    required this.KCalxKg,
    required this.CO2xKg,
    required this.WaterxKg,
    required this.ProteinxKg,
    required this.FatxKg,
    required this.SugarxKg,
  });
}
