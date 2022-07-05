import 'dart:convert';

import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:http/http.dart' as http;

class DestinationApiService {
  static const String _baseUrl = 'https://jti-api.herokuapp.com/v1';

  Future<Destination> getAllDestinationApi() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/destination'));
      if (response.statusCode == 200) {
        return Destination.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Destination List');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DestinationResult> getDestinationApi(String id) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/destination/$id'));
      if (response.statusCode == 200) {
        return DestinationResult.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Destination List');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Destination> getDestinationSearch(String query) async {
    try {
      final response = await http
          .get(Uri.parse(_baseUrl + '/destination/search?name=$query'));
      if (response.statusCode == 200) {
        return Destination.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Destination search');
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
