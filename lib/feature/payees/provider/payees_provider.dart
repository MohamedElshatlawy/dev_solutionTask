import 'package:flutter/foundation.dart';
import 'package:money_app/feature/payees/data/model/payee_model.dart';
import 'package:money_app/feature/payees/data/repo/payees_api.dart';

class PayeesProvider extends ChangeNotifier{
  final PayeesApi _payeesApi=PayeesApi();
  bool _loading=false;
  List<Payee> payees=[];

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  bool get loading => _loading;

  Future<void> getPayees(String id)async{

    try {
      loading = true;
      final payeesResponse=await _payeesApi.getPayees(id);
      print(payees.length);
      loading = false;
      payees=payeesResponse;
    } catch (e) {
      loading = false;
      debugPrint(e.toString());
      rethrow;
    }

    notifyListeners();

  }

}