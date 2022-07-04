import 'dart:io';

import 'package:capstone_project_jti/data/api/hotel_api_service.dart';
import 'package:capstone_project_jti/data/model/hotel.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';

import 'package:flutter/foundation.dart';

class DetailHotelProvider extends ChangeNotifier {
  final HotelApiService apiService;

  DetailHotelProvider({this.apiService}) {
    fetchHotel(id);
  }

  HotelResult _hotel;
  ResultState _state;
  String _message = '';
  final String _id = '';

  String get message => _message;
  HotelResult get result => _hotel;
  ResultState get state => _state;
  String get id => _id;

  Future<void> fetchHotel(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final hotel = await apiService.getHotelApi(id);
      if (hotel.id.isEmpty) {
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
