import 'package:flutter/foundation.dart';
import 'package:wizards_money/features/sign_in/sign_in_state.dart';
import 'package:wizards_money/services/auth_service.dart';

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
    _changeState(SignInLoadingState());
    
    try {
      await _service.signIn(
        email: email, 
        password: password
      );
    
    _changeState(SignInSuccessState());
    } catch (e) {
      _changeState(SignInErrorState(e.toString()));
    }
  }
}