import 'package:flutter/foundation.dart';
import 'package:wizards_money/features/sign_in/sign_in_state.dart';
import 'package:wizards_money/services/auth_service.dart';
import 'package:wizards_money/services/secure_storage.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInController(this._service);

  SignInState _state = SignInInitialState();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

    Future<void> signIn({
    required String email, 
    required String password
  }) async {
    const secureStorage = SecureStorage();
    _changeState(SignInLoadingState());
    
    try {
      final user = await _service.signIn(
        email: email, 
        password: password
      );
    
      if(user.id != null) {
        await secureStorage.write(key: "CURRENT_USER", value: user.toJson());

        _changeState(SignInSuccessState());
      } else {
        throw Exception();
      }

    _changeState(SignInSuccessState());
    } catch (e) {
      _changeState(SignInErrorState(e.toString()));
    }
  }
}