import 'dart:convert';

import 'package:api_demo/model/country_model.dart';
import 'package:api_demo/model/world_state_model.dart';
import 'package:api_demo/services/app_url.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  Future<WorldStateModel> fetchWorldStatsRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  // //List<CountryModel> countryList = [];

  // Future<List<CountryModel>> countriesListApi(
  //     List<CountryModel> countryList) async {
  //   final response = await http.get(Uri.parse(AppUrl.countriesList));
  //   print(response.statusCode + 13);
  //   var data = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     for (var i in data) {
  //       countryList.add(CountryModel.fromJson(i));
  //     }
  //     return countryList;
  //   } else {
  //     return countryList;
  //   }
  // }

  Future<List<dynamic>> countriesListApi() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('error');
    }
  }
}
