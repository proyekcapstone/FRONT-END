import 'dart:io';

import 'package:capstone_project_jti/api/hotel_source.dart';
import 'package:capstone_project_jti/model/hotel_model.dart';
import 'package:capstone_project_jti/provider/result_state.dart';
import 'package:flutter/cupertino.dart';

class HotelProvider extends ChangeNotifier {
  final HotelSource hotelSource;

  HotelProvider({this.hotelSource}) {
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
      final hotel = await hotelSource.getAllHotelApi();
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
