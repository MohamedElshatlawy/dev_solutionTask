import 'package:flutter/foundation.dart';
import 'package:money_app/feature/accounts/data/model/account_model.dart';
import 'package:money_app/feature/accounts/data/repo/accounts_api.dart';

class AccountsProvider extends ChangeNotifier{
  final AccountsApi _accountsApi=AccountsApi();
  bool _loading=false;
  List<Account> accounts=[];

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  bool get loading => _loading;

  Future<void> getAccounts(String id)async{

    try {
      loading = true;
      final accountsResponse=await _accountsApi.getAccounts(id);
      print(accounts.length);
      loading = false;
      accounts=accountsResponse;
      accounts.sort((b, a) => a.balance.compareTo(b.balance));
      print(' this our new Data --> ${accounts[0].name}');
    } catch (e) {
      loading = false;
      debugPrint(e.toString());
      rethrow;
    }

    notifyListeners();

  }
  Future<bool> addAccount(String id,Map<String,dynamic> formData)async{

    try {
      final accountsResponse=await _accountsApi.addAccount(id,formData);
      if(accountsResponse.id!=null){
        return true;
      }else{
        return false;
      }

    } catch (e) {

      debugPrint(e.toString());
      //rethrow;
      return false;
    }

    notifyListeners();

  }

}