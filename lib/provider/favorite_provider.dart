/*import 'package:capstone_project_jti/db/database_helper.dart';
import 'package:capstone_project_jti/provider/result_state.dart';
import 'package:flutter/cupertino.dart';

class FavoriteProvider extends ChangeNotifier {
  final DatabaseHelper favoriteHelper;

  FavoriteProvider({this.favoriteHelper}) {
    getFavorite();
  }

  ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<DestinationElement> _favorite = [];
  List<DestinationElement> get favorite => _favorite;

  Future<bool> isFavorite(String id) async {
    final favoriteDestination = await favoriteHelper.getFavoriteById(id);
    return favoriteDestination.isNotEmpty;
  }

  void getFavorite() async {
    _favorite = await favoriteHelper.getFavorite();
    if(_favorite.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'no data';
    }

  notifyListeners();  
  }

  void addFavorite() async {
    try {
      await favoriteHelper.addFavorite(destination);
      getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'error: $e';
      notifyListeners();
    }
  }

  void removeFavorite(String id) async {
    try {
      await favoriteHelper.removeFavorite(id);
      getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error $e';
      notifyListeners();
    }
  }
}*/