import 'dart:io';

import 'package:capstone_project_jti/data/api/destination_api_service.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';

import 'package:flutter/foundation.dart';

class DetailDestinationProvider extends ChangeNotifier {
  final DestinationApiService apiService;

  DetailDestinationProvider({this.apiService}) {
    fetchDestination(id);
  }

  DestinationResult _destination;
  ResultState _state;
  String _message = '';
  final String _id = '';

  String get message => _message;
  DestinationResult get result => _destination;
  ResultState get state => _state;
  String get id => _id;

  Future<void> fetchDestination(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final destination = await apiService.getDestinationApi(id);
      if (destination.id.isEmpty) {
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
