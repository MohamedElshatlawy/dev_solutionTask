import 'package:money_app/feature/accounts/data/model/account_model.dart';
import 'package:money_app/feature/budgets/data/model/currency_format.dart';
import 'package:money_app/feature/budgets/data/model/date_format.dart';

class Budget{

  String id;
  String name;
  String lastModifiedOn;
  String firstMonth;
  String lastMonth;
  DateFormatType dateFormat;
  CurrencyFormat currencyFormat;
  List<Account> accounts;

  Budget(
      {this.id,
        this.name,
        this.lastModifiedOn,
        this.firstMonth,
        this.lastMonth,
        this.dateFormat,
        this.currencyFormat,
        this.accounts});

  Budget.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastModifiedOn = json['last_modified_on'];
    firstMonth = json['first_month'];
    lastMonth = json['last_month'];
    dateFormat = json['date_format'] != null
        ? new DateFormatType.fromJson(json['date_format'])
        : null;
    currencyFormat = json['currency_format'] != null
        ? new CurrencyFormat.fromJson(json['currency_format'])
        : null;
    if (json['accounts'] != null) {
      accounts = new List<Account>();
      json['accounts'].forEach((v) {
        accounts.add(new Account.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_modified_on'] = this.lastModifiedOn;
    data['first_month'] = this.firstMonth;
    data['last_month'] = this.lastMonth;
    if (this.dateFormat != null) {
      data['date_format'] = this.dateFormat.toJson();
    }
    if (this.currencyFormat != null) {
      data['currency_format'] = this.currencyFormat.toJson();
    }
    if (this.accounts != null) {
      data['accounts'] = this.accounts.map((v) => v.toJson()).toList();
    }
    return data;
  }

}