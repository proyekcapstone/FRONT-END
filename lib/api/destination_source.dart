import 'dart:convert';

import 'package:capstone_project_jti/model/destination_model.dart';

import 'package:http/http.dart' as http;

class DestinationSource {
  static const String _baseUrl = 'https://jti-app.herokuapp.com/v1';

  Future<Destination> getAllDestinationApi() async {
    final response = await http.get(Uri.parse(_baseUrl + '/destination'));
    if (response.statusCode == 200) {
      return Destination.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Destination List');
    }
  }

  /*Future<DestinationElement> getDestinationApi(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + '/destination/$id'));
    if (response.statusCode == 200) {
      return DestinationElement.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Destination');
    }
  }*/
}
