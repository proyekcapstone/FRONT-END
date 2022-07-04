import 'dart:io';

import 'package:capstone_project_jti/data/api/hotel_api_service.dart';
import 'package:capstone_project_jti/data/model/hotel.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';

import 'package:flutter/foundation.dart';

class SearchHotelProvider extends ChangeNotifier {
  final HotelApiService apiService;

  SearchHotelProvider({this.apiService}) {
    searchAllHotel(query);
  }

  Hotel _hotel;
  ResultState _state;
  String _message = '';
  final String _query = '';

  String get message => _message;
  Hotel get result => _hotel;
  ResultState get state => _state;
  String get query => _query;

  Future searchAllHotel(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final hotel = await apiService.getHotelSearch(query);
      if (hotel.hotels.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _hotel = hotel;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "No Internet Connection";
    } catch (err) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $err';
    }
  }
}
