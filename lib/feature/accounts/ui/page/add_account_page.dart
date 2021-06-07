import 'package:flutter/material.dart';
import 'package:money_app/core/util/generate_screen.dart';
import 'package:money_app/feature/accounts/provider/accounts_provider.dart';
import 'package:money_app/feature/accounts/ui/widget/add_account_button.dart';
import 'package:money_app/feature/accounts/ui/widget/text_form_field.dart';
import 'package:provider/provider.dart';

class AddAccountPage extends StatefulWidget {
  final String id;
  AddAccountPage({this.id});
  @override
  _AddAccountPageState createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  List<String> items = [
    'checking',
    'savings',
    'creditCard',
    'cash',
    'lineOfCredit',
    'otherAsset',
    'otherLiability'
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _loading = false;
  Map<String, dynamic> _accountInfo = {};
  String name = '';
  String type = '';
  String balance = '';
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Account'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  AddAccountTextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Your Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _accountInfo['name'] = value;
                    },
                    maxLines: 1,
                    hintText: 'Name',
                    textInputType: TextInputType.text,
                    //filledColor: Colors.white,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AddAccountTextFormField(
                    textEditingController: _controller,
                    readOnly: true,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter account type';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _accountInfo['type'] = value;
                    },
                    maxLines: 1,
                    hintText: 'Type',
                    textInputType: TextInputType.text,
                    //filledColor: Colors.white,
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 40.0,
                        color: Colors.black,
                      ),
                      onSelected: (String value) {
                        _controller.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items.map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                    // suffixIcon: IconButton(
                    //     icon: Icon(
                    //       Icons.keyboard_arrow_down,
                    //       size: 35.0,
                    //       color: ThemeColors.getBlackColor(),
                    //     ),
                    //     onPressed: () {}),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AddAccountTextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Your Balance';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _accountInfo['balance'] = int.tryParse(value);
                    },
                    maxLines: 1,
                    hintText: 'Balance',
                    textInputType: TextInputType.text,
                    //filledColor: Colors.white,
                  ),
                ],
              ),
              _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : AddAccountButton(
                      width: double.infinity,
                      fontSize: 16.0,
                      name: 'Add ',
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          setState(() {
                            _loading=true;
                          });
                          print(_accountInfo.toString());
                          final addAccount =
                              await Provider.of<AccountsProvider>(context,
                                      listen: false)
                                  .addAccount(widget.id, _accountInfo);
                          if (addAccount) {
                            setState(() {
                              _loading=false;
                            });
                            Navigator.pop(context);
                          } else {
                            setState(() {
                              _loading=false;
                            });
                            print('Error NetWork');
                          }
                        } else {
                          setState(() {
                            _autoValidate = true;
                            _loading=false;
                          });
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
