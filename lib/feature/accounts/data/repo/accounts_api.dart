import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:money_app/core/util/constants.dart';
import 'package:money_app/feature/accounts/data/model/account_model.dart';

class AccountsApi{

  final Dio _dio = Dio();

  Future<List<Account>> getAccounts(String idBudget) async {
    try {
      final response = await _dio.get(Endpoints.BUDGETS+'/$idBudget/accounts',
          options: GetOptions.getOptionsWithToken(Endpoints.TOKEN),
          // queryParameters: {'include_accounts': true,},
          );
      if (response != null ) {
        final lastResponse= response.data['data']['accounts'] as List;
        final List<Account> finalResponse=lastResponse.map((e) => Account.fromJson(e)).toList();
        print('this record nw ${response.data.toString()}');
        return finalResponse;
      }

    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Account> addAccount(String idBudget,Map<String,dynamic> data) async {
    try {
      final response = await _dio.post(Endpoints.BUDGETS+'/$idBudget/accounts',
        options: GetOptions.getOptionsWithToken(Endpoints.TOKEN),
        data: {
        'account':data,
        },
        // queryParameters: {'include_accounts': true,},
      );
      if (response != null ) {
        final lastResponse= response.data['data']['account'];
        final Account finalResponse=Account.fromJson(lastResponse);
        print('this record nw ${response.data.toString()}');
        return finalResponse;
      }

    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

}