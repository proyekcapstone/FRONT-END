import 'dart:io';

import 'package:capstone_project_jti/api/destination_source.dart';
import 'package:capstone_project_jti/model/destination_model.dart';
import 'package:capstone_project_jti/provider/result_state.dart';
import 'package:flutter/cupertino.dart';

class DestinationProvider extends ChangeNotifier {
  final DestinationSource destinationSource;

  DestinationProvider({this.destinationSource}) {
    fetchAllDestination();
  }

  Destination _destination;
  ResultState _state;
  String _message = '';

  String get message => _message;
  Destination get result => _destination;
  ResultState get state => _state;

  Future<void> fetchAllDestination() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final destination = await destinationSource.getAllDestinationApi();
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
