import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_app/feature/budgets/data/model/budget.dart';

class BudgetDetail extends StatefulWidget {
  final Budget budget;
  BudgetDetail({this.budget});

  @override
  _BudgetDetailState createState() => _BudgetDetailState();
}

class _BudgetDetailState extends State<BudgetDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Detail'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ' + widget.budget.name,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'From: ' +
                  DateFormat(widget.budget.dateFormat.format.split('/').first +
                          widget.budget.dateFormat.format
                              .substring(2)
                              .toLowerCase())
                      .format(
                    DateTime.parse(widget.budget.firstMonth),
                  ),
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'To: ' +
                  DateFormat(widget.budget.dateFormat.format.split('/').first +
                          widget.budget.dateFormat.format
                              .substring(2)
                              .toLowerCase())
                      .format(DateTime.parse(widget.budget.lastMonth)),
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Last Edited: ' +
                  DateFormat(widget.budget.dateFormat.format.split('/').first +
                          widget.budget.dateFormat.format
                              .substring(2)
                              .toLowerCase())
                      .format(
                    DateTime.parse(widget.budget.lastModifiedOn),
                  ),
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
