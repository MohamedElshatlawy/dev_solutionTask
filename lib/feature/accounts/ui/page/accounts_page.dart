import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:money_app/core/util/generate_screen.dart';
import 'package:money_app/feature/accounts/provider/accounts_provider.dart';
import 'package:money_app/feature/accounts/ui/widget/add_account_button.dart';
import 'package:provider/provider.dart';

class AccountsPage extends StatefulWidget {
  final String id;
  AccountsPage({this.id});

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AccountsProvider>(context, listen: false)
          .getAccounts(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accounts',
        ),
        centerTitle: true,
      ),
      body: Consumer<AccountsProvider>(
        builder: (context, account, _) => account.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : account.accounts.isEmpty
                ? Center(
                    child: Text('No Accounts'),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 90.0),
                    child: ListView.builder(
                      //physics: ScrollPhysics(),
                      //shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      itemCount: account.accounts.length,
                      itemBuilder: (context, index) => !account
                              .accounts[index].deleted
                          ? Card(
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
                                        account.accounts[index].name,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'Type : ' + account.accounts[index].type,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'Balance : ' +
                                          account.accounts[index].balance
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
      ),
      bottomSheet: Container(
        height: 80.0,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 17.0),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            )),
        child: AddAccountButton(
          width: double.infinity,
          fontSize: 16.0,
          name: 'Add Account',
          onPressed: () {
            Navigator.pushNamed(context, NameScreen.ADD_ACCOUNT_PAGE,
                    arguments: widget.id)
                .then((value) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Provider.of<AccountsProvider>(context, listen: false)
                    .getAccounts(widget.id);
              });
            });
          },
        ),
      ),
    );
  }
}
