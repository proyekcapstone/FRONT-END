import 'dart:convert';

import 'package:capstone_project_jti/model/culinary_model.dart';

import 'package:http/http.dart' as http;

class CulinarySource {
  static const String _baseUrl = 'https://jti-app.herokuapp.com/v1';

  Future<Culinary> getAllCulinaryApi() async {
    final response = await http.get(Uri.parse(_baseUrl + '/culinary'));
    if (response.statusCode == 200) {
      return Culinary.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Culinary List');
    }
  }

  /*Future<CulinaryElement> getCulinaryApi(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + '/culinary/$id'));
    if (response.statusCode == 200) {
      return CulinaryElement.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Culinary');
    }
  }*/
}
