import 'package:flutter/material.dart';
import '../data.dart';
import '../Models/Meal.dart';

class Meal with ChangeNotifier {
  List<MealItem> _items = [];

  List<MealItem> get items {
    return [..._items];
  }

  MealItem findById(String Id) {
    return _items.firstWhere((i) => i.id == Id);
  }

  double getTotalKCalByDay(String _datepart) {
    double total = 0;

    List<MealItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      element.ingredients.forEach((internal) {
        final _selectedIngredient =
            DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == internal);

        total += _selectedIngredient.KCalxKg;
      });
    });

    return total;
  }

  double getTotalCO2ByDay(String _datepart) {
    double total = 0;

    List<MealItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      element.ingredients.forEach((internal) {
        final _selectedIngredient =
            DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == internal);

        total += _selectedIngredient.CO2xKg;
      });
    });

    return total;
  }

  double getTotalWaterByDay(String _datepart) {
    double total = 0;

    List<MealItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      element.ingredients.forEach((internal) {
        final _selectedIngredient =
            DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == internal);

        total += _selectedIngredient.WaterxKg;
      });
    });

    return total;
  }

  double getTotalProteinByDay(String _datepart) {
    double total = 0;

    List<MealItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      element.ingredients.forEach((internal) {
        final _selectedIngredient =
            DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == internal);

        total += _selectedIngredient.ProteinxKg;
      });
    });

    return total;
  }

  double getTotalFatByDay(String _datepart) {
    double total = 0;

    List<MealItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      element.ingredients.forEach((internal) {
        final _selectedIngredient =
            DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == internal);

        total += _selectedIngredient.FatxKg;
      });
    });

    return total;
  }

  double getTotalSugarByDay(String _datepart) {
    double total = 0;

    List<MealItem> lstitem =
        _items.where((i) => i.datepart == _datepart).toList();

    lstitem.forEach((element) {
      element.ingredients.forEach((internal) {
        final _selectedIngredient =
            DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == internal);

        total += _selectedIngredient.SugarxKg;
      });
    });

    return total;
  }

  double getTotalKCal(String Id) {
    double total = 0;
    MealItem meal = _items.firstWhere((i) => i.id == Id);
    meal.ingredients.forEach((element) {
      final _selectedIngredient =
          DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == element);

      total += _selectedIngredient.KCalxKg;
    });
    return total;
  }

  double getTotalCO2(String Id) {
    double total = 0;
    MealItem meal = _items.firstWhere((i) => i.id == Id);
    meal.ingredients.forEach((element) {
      final _selectedIngredient =
          DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == element);

      total += _selectedIngredient.CO2xKg;
    });
    return total;
  }

  double getTotalWater(String Id) {
    double total = 0;
    MealItem meal = _items.firstWhere((i) => i.id == Id);
    meal.ingredients.forEach((element) {
      final _selectedIngredient =
          DUMMY_INGREDIENTS.firstWhere((ing) => ing.id == element);

      total += _selectedIngredient.WaterxKg;
    });
    return total;
  }

  void addMeal(MealItem value) {
    _items.add(value);
    notifyListeners();
  }

  void updateMeal(MealItem value, String txingredient) {
    MealItem prevItem = _items.firstWhere((i) => i.id == value.id);
    List<String> ingredients = [...value.ingredients, txingredient];

    _items.remove(prevItem);

    final newTx = MealItem(
        id: value.id,
        date: value.date,
        datepart: value.datepart,
        type: value.type,
        ingredients: ingredients);

    _items.add(newTx);
    notifyListeners();
  }
}
