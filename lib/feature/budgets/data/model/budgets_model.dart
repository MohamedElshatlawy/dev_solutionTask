import 'package:money_app/feature/budgets/data/model/budget.dart';

class BudgetsModel {
  List<Budget> budgets;
  Budget defaultBudget;

  BudgetsModel({this.budgets, this.defaultBudget});

  BudgetsModel.fromJson(Map<String, dynamic> json) {
    if (json['budgets'] != null) {
      budgets = new List<Budget>();
      json['budgets'].forEach((v) {
        budgets.add(new Budget.fromJson(v));
      });
    }
    defaultBudget = json['default_budget'] != null
        ? new Budget.fromJson(json['default_budget'])
        : null;
  }
}