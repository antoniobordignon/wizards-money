import 'package:flutter/foundation.dart';
import 'package:wizards_money/features/sign_up/sign_up_state.dart';
import 'package:wizards_money/services/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;

  SignUpController(this._service); 
  
  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState){
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email, 
    required String password
  }) async {
    _changeState(SignUpLoadingState());
    
    try {
      await _service.signUp(
        name: name,
        email: email, 
        password: password
      );
    
    _changeState(SignUpSuccessState());
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}