import 'dart:ffi';

class WeightItem {
  final String id;
  final DateTime date;
  final String datepart;
  final double Weight;

  const WeightItem(
      {required this.id,
      required this.date,
      required this.datepart,
      required this.Weight});
}
