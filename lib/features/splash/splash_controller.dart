import 'package:flutter/foundation.dart';
import 'package:wizards_money/features/splash/splash_state.dart';
import 'package:wizards_money/services/secure_storage.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;

  SplashController(this._service);

  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> isUserLogged() async {
    final _result = await _service.readOne(key: "CURRENT_USER");

    if (_result != null) {
      _changeState(SplashSuccessState());
    } else {
      _changeState(SplashErrorState());
    }
  }
}
