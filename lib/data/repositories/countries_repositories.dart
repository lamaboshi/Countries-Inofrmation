import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/countries.dart';

class CountriesRepositories {
  Future<Countries> getCountries(String name) async {
    final response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/name/$name?fullText=true"));
    if (response.statusCode == 200) {
      print(response.body);
      var item = json.decode(response.body) as List<dynamic>;
      return Countries.fromJson(item.first);
    } else {
      throw Exception("Failed to load Countries");
    }
  }
}
