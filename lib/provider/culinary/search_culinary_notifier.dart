import 'dart:io';

import 'package:capstone_project_jti/data/api/culinary_api_service.dart';
import 'package:capstone_project_jti/data/model/culinary.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';

import 'package:flutter/foundation.dart';

class SearchCulinaryProvider extends ChangeNotifier {
  final CulinaryApiService apiService;

  SearchCulinaryProvider({this.apiService}) {
    searchAllCulinary(query);
  }

  Culinary _culinary;
  ResultState _state;
  String _message = '';
  final String _query = '';

  String get message => _message;
  Culinary get result => _culinary;
  ResultState get state => _state;
  String get query => _query;

  Future searchAllCulinary(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final culinary = await apiService.getCulinarySearch(query);
      if (culinary.culinaries.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _culinary = culinary;
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
