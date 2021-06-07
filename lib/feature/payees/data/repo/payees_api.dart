import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:money_app/core/util/constants.dart';
import 'package:money_app/feature/payees/data/model/payee_model.dart';

class PayeesApi{

  final Dio _dio = Dio();

  Future<List<Payee>> getPayees(String idBudget) async {
    try {
      final response = await _dio.get(Endpoints.BUDGETS+'/$idBudget/payees',
        options: GetOptions.getOptionsWithToken(Endpoints.TOKEN),
      );
      if (response != null ) {
        print('this record nw ${response.data.toString()}');
        final lastResponse= response.data['data']['payees'] as List;
        final List<Payee> finalResponse=lastResponse.map((e) => Payee.fromJson(e)).toList();
        return finalResponse;
      }

    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}