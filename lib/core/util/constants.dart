import 'package:dio/dio.dart';


///
///
/// The [Endpoints] class is a way to separate the API's endpoints and base url from the remote data sources classes
/// and put them in one easy to edit class
///
/// 1- static and const values which are:
///
/// * [Endpoints.BASE_URL] the base url of the backend system we are working with
///
///
///
class Endpoints {
  static const TOKEN = '2f46a591c7d602b77bd92e739321ee71c98fee83a68ea7931307a04ccc869f12';
  static const BASE_URL = 'https://api.youneedabudget.com/v1';
  static const BUDGETS = '$BASE_URL/budgets';

}





///
/// [GetOptions] class is for gathering all the options for the [Dio] package in one class
///
class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(
      String token, {
        String accept = 'application/json',
        String contentType = 'application/json',
        String language = '',
      }) {
    options.headers = {
      'Accept-Language': language,
      'Accept': accept,
    }..addEntries([
      if (contentType != null) MapEntry('Content-Type', contentType),
      if ((token ?? '').isNotEmpty) MapEntry('Authorization', 'Bearer $token')
    ]);
    return options;
  }
}