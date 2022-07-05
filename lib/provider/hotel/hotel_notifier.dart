import 'dart:io';

import 'package:capstone_project_jti/data/api/hotel_api_service.dart';
import 'package:capstone_project_jti/data/model/hotel.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';

import 'package:flutter/foundation.dart';

class HotelProvider extends ChangeNotifier {
  final HotelApiService apiService;

  HotelProvider({this.apiService}) {
    fetchAllHotel();
  }

  Hotel _hotel;
  ResultState _state;
  String _message = '';

  String get message => _message;
  Hotel get result => _hotel;
  ResultState get state => _state;

  Future<void> fetchAllHotel() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final hotel = await apiService.getAllHotelApi();
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
