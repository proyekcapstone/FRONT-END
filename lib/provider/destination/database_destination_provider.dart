import 'package:capstone_project_jti/data/db/database_helper.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:capstone_project_jti/helpers/result_state.dart';

import 'package:flutter/foundation.dart';

class DatabaseDestinationProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseDestinationProvider({this.databaseHelper}) {
    getDestinationFavorites();
  }

  ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<DestinationResult> _favorites = [];
  List<DestinationResult> get favorites => _favorites;

  void getDestinationFavorites() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _favorites = await databaseHelper.getDestinationFavorite();
      if (_favorites.isNotEmpty) {
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
        _message = 'Empty Data';
      }
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  void addDestinationFavorite(DestinationResult restaurant) async {
    try {
      await databaseHelper.addDestinationFavorite(restaurant);
      getDestinationFavorites();
    } catch (err) {
      _state = ResultState.error;
      _message = 'Error: $err';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async {
    final favoritedRestaurant =
        await databaseHelper.getDestinationFavoriteById(id);
    return favoritedRestaurant.isNotEmpty;
  }

  void removeDestinationFavorite(String id) async {
    try {
      await databaseHelper.removeDestinationFavorite(id);
      getDestinationFavorites();
    } catch (err) {
      _state = ResultState.error;
      _message = 'Error: $err';
      notifyListeners();
    }
  }
}
