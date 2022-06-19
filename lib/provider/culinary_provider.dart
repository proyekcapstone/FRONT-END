import 'dart:io';

import 'package:capstone_project_jti/api/culinary_source.dart';
import 'package:capstone_project_jti/model/culinary_model.dart';
import 'package:capstone_project_jti/provider/result_state.dart';
import 'package:flutter/cupertino.dart';

class CulinaryProvider extends ChangeNotifier {
  final CulinarySource culinarySource;

  CulinaryProvider({this.culinarySource}) {
    fetchAllCulinary();
  }

  Culinary _culinary;
  ResultState _state;
  String _message = '';

  String get message => _message;
  Culinary get result => _culinary;
  ResultState get state => _state;

  Future<void> fetchAllCulinary() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final culinary = await culinarySource.getAllCulinaryApi();
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
