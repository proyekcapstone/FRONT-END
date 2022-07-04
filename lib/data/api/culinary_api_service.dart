import 'dart:convert';

import 'package:capstone_project_jti/data/model/culinary.dart';
import 'package:http/http.dart' as http;

class CulinaryApiService {
  static const String _baseUrl = 'https://jti-api.herokuapp.com/v1';

  Future<Culinary> getAllCulinaryApi() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/culinary'));
      if (response.statusCode == 200) {
        return Culinary.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Culinary List');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CulinaryResult> getCulinaryApi(String id) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/culinary/$id'));
      if (response.statusCode == 200) {
        return CulinaryResult.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Culinary List');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Culinary> getCulinarySearch(String query) async {
    try {
      final response = await http
          .get(Uri.parse(_baseUrl + '/culinary/search?name=$query'));
      if (response.statusCode == 200) {
        return Culinary.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Culinary search');
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
