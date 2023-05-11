import 'dart:ffi';

class ExerciseItem {
  final String id;
  final DateTime date;
  final String datepart;
  final double KCal;

  const ExerciseItem(
      {required this.id,
      required this.date,
      required this.datepart,
      required this.KCal});
}
