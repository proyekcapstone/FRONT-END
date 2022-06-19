import 'dart:convert';

import 'package:capstone_project_jti/model/hotel_model.dart';

import 'package:http/http.dart' as http;

class HotelSource {
  static const String _baseUrl = 'https://jti-app.herokuapp.com/v1';

  Future<Hotel> getAllHotelApi() async {
    final response = await http.get(Uri.parse(_baseUrl + '/hotel'));
    if (response.statusCode == 200) {
      return Hotel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Hotel List');
    }
  }

  /*Future<HotelElement> getHotelApi(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + '/hotel/$id'));
    if (response.statusCode == 200) {
      return HotelElement.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Hotel');
    }
  }*/
}
