import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:money_app/core/util/generate_screen.dart';
import 'package:money_app/feature/budgets/provider/budget_provider.dart';
import 'package:money_app/feature/budgets/ui/widget/button_widget.dart';
import 'package:provider/provider.dart';

class BudgetsPage extends StatefulWidget {
  @override
  _BudgetsPageState createState() => _BudgetsPageState();
}

class _BudgetsPageState extends State<BudgetsPage> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BudgetProvider>(context, listen: false).getBudgets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgets'),
        centerTitle: true,
      ),
      body: Consumer<BudgetProvider>(
        builder: (context, provider, _) => provider.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : provider.budgets.isEmpty
                ? Center(
                    child: Text('No Budgets yet!'),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                      //physics: ScrollPhysics(),
                      //shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      itemCount: provider.budgets.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.budgets[index].name,
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'From: ' +
                                        DateFormat(provider.budgets[index]
                                                    .dateFormat.format
                                                    .split('/')
                                                    .first +
                                                provider.budgets[index]
                                                    .dateFormat.format
                                                    .substring(2)
                                                    .toLowerCase())
                                            .format(DateTime.parse(provider
                                                .budgets[index].firstMonth)),
                                    // DateTime.parse(provider.budgets[index].firstMonth).toString(),
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'To: ' +
                                        DateFormat(provider.budgets[index]
                                                    .dateFormat.format
                                                    .split('/')
                                                    .first +
                                                provider.budgets[index]
                                                    .dateFormat.format
                                                    .substring(2)
                                                    .toLowerCase())
                                            .format(DateTime.parse(provider
                                                .budgets[index].lastMonth)),
                                    // DateTime.parse(provider.budgets[index].firstMonth).toString(),
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonWidget(
                                    name: 'Details',
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          NameScreen.BUDGET_DETAIL_PAGE,
                                          arguments: provider.budgets[index]);
                                    },
                                  ),
                                  ButtonWidget(
                                    name: 'Accounts',
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          NameScreen.ACCOUNTS_PAGE,
                                          arguments: provider.budgets[index].id);
                                    },
                                  ),
                                  ButtonWidget(
                                    name: 'Payees',
                                    onPressed: () {

                                      Navigator.pushNamed(context,
                                          NameScreen.PAYEES_PAGE,
                                          arguments: provider.budgets[index].id);

                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
