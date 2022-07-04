import 'dart:io';

import 'package:capstone_project_jti/data/api/culinary_api_service.dart';
import 'package:capstone_project_jti/data/model/culinary.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';

import 'package:flutter/foundation.dart';

class DetailCulinaryProvider extends ChangeNotifier {
  final CulinaryApiService apiService;

  DetailCulinaryProvider({this.apiService}) {
    fetchCulinary(id);
  }

  CulinaryResult _culinary;
  ResultState _state;
  String _message = '';
  final String _id = '';

  String get message => _message;
  CulinaryResult get result => _culinary;
  ResultState get state => _state;
  String get id => _id;

  Future<void> fetchCulinary(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final culinary = await apiService.getCulinaryApi(id);
      if (culinary.id.isEmpty) {
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
