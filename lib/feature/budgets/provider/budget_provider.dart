import 'package:flutter/material.dart';
import 'package:money_app/feature/budgets/data/model/budget.dart';
import 'package:money_app/feature/budgets/data/repo/budget_api.dart';

class BudgetProvider extends ChangeNotifier{
 final BudgetApi _budgetApi=BudgetApi();
  bool _loading=false;
  List<Budget> budgets=[];
  Budget defBudget;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  bool get loading => _loading;

  Future<void> getBudgets()async{

    try {
      loading = true;
      final budgetsModel=await _budgetApi.getBudgets();
      print(budgetsModel.budgets.length);
      loading = false;
      budgets=budgetsModel.budgets;
      defBudget=budgetsModel.defaultBudget;
      print(' this our new Data --> ${budgets[0].id}');
    } catch (e) {
      loading = false;
      debugPrint(e.toString());
    }

    notifyListeners();

  }

}