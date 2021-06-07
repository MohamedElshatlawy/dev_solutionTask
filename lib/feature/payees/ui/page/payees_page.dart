import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:money_app/feature/payees/provider/payees_provider.dart';
import 'package:provider/provider.dart';

class PayeesPage extends StatefulWidget {
  final String id;
  PayeesPage({@required this.id});

  @override
  _PayeesPageState createState() => _PayeesPageState();
}

class _PayeesPageState extends State<PayeesPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PayeesProvider>(context, listen: false).getPayees(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payees'),
        centerTitle: true,
      ),
      body: Consumer<PayeesProvider>(
        builder: (context, payee, _) => payee.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : payee.payees.isEmpty
                ? Center(
                    child: Text('No Payees'),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                      //physics: ScrollPhysics(),
                      //shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      itemCount: payee.payees.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  payee.payees[index].name,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
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
