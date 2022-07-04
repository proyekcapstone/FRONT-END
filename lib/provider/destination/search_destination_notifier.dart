import 'dart:io';

import 'package:capstone_project_jti/data/api/destination_api_service.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';

import 'package:flutter/foundation.dart';

class SearchDestinationProvider extends ChangeNotifier {
  final DestinationApiService apiService;

  SearchDestinationProvider({this.apiService}) {
    searchAllDestination(query);
  }

  Destination _destination;
  ResultState _state;
  String _message = '';
  final String _query = '';

  String get message => _message;
  Destination get result => _destination;
  ResultState get state => _state;
  String get query => _query;

  Future searchAllDestination(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final destination = await apiService.getDestinationSearch(query);
      if (destination.destinations.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _destination = destination;
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
