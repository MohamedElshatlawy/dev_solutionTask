import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:money_app/core/util/constants.dart';
import 'package:money_app/feature/budgets/data/model/budgets_model.dart';

class BudgetApi {
  final Dio _dio = Dio();

  Future<BudgetsModel> getBudgets() async {
    try {
      final response = await _dio.get(Endpoints.BUDGETS,
          options: GetOptions.getOptionsWithToken(Endpoints.TOKEN),
          queryParameters: {
            'include_accounts': true,
          });
      if (response != null ) {
        print('this record nw ${response.data.toString()}');
        return BudgetsModel.fromJson(response.data['data']);
      }

    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }


}
