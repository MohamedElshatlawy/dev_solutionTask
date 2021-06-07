import 'package:flutter/material.dart';
import 'package:money_app/feature/accounts/ui/page/accounts_page.dart';
import 'package:money_app/feature/accounts/ui/page/add_account_page.dart';
import 'package:money_app/feature/budgets/ui/page/budget_detail.dart';
import 'package:money_app/feature/budgets/ui/page/budgets_page.dart';
import 'package:money_app/feature/payees/ui/page/payees_page.dart';

///
///
/// [GenerateScreen.onGenerate] function is responsible for returning the specific [Route] with the right data.
///

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String name = value.name;
    print("the name is $name");
    final args = value.arguments;
    switch (name) {
      case NameScreen.BUDGETS_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => BudgetsPage(),
          );
        }

      case NameScreen.BUDGET_DETAIL_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => BudgetDetail(
              budget: args,
            ),
          );
        }

      case NameScreen.ACCOUNTS_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => AccountsPage(
              id: args,
            ),
          );
        }
      case NameScreen.ADD_ACCOUNT_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => AddAccountPage(
              id: args,
            ),
          );
        }

      case NameScreen.PAYEES_PAGE:
        {
          return MaterialPageRoute(
            builder: (context) => PayeesPage(
              id: args,
            ),
          );
        }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR Page'),
          ),
        );
      },
    );
  }

}

///
/// [NameScreen] class is responsible for declaring the routing names
///
class NameScreen {
  static const String BUDGETS_PAGE = "/";
  static const String BUDGET_DETAIL_PAGE = "budget_detail_page";
  static const String ACCOUNTS_PAGE = "accounts_page";
  static const String ADD_ACCOUNT_PAGE = "add_account_page";
  static const String PAYEES_PAGE = "payees_page";



}