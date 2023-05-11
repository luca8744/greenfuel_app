enum MealType { Breakfast, MorningBreak, Lunch, AfternoonBreak, Dinner, Extra }

class MealItem {
  final String id;
  final DateTime date;
  final String datepart;
  final MealType type;

  final List<String> ingredients;

  const MealItem(
      {required this.id,
      required this.date,
      required this.type,
      required this.datepart,
      this.ingredients = const []});
}
