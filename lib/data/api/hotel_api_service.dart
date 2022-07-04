import 'dart:convert';

import 'package:capstone_project_jti/data/model/hotel.dart';
import 'package:http/http.dart' as http;

class HotelApiService {
  static const String _baseUrl = 'https://jti-api.herokuapp.com/v1';

  Future<Hotel> getAllHotelApi() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/hotel'));
      if (response.statusCode == 200) {
        return Hotel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Hotel List');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<HotelResult> getHotelApi(String id) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/hotel/$id'));
      if (response.statusCode == 200) {
        return HotelResult.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Hotel List');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Hotel> getHotelSearch(String query) async {
    try {
      final response = await http
          .get(Uri.parse(_baseUrl + '/hotel/search?name=$query'));
      if (response.statusCode == 200) {
        return Hotel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Hotel search');
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
