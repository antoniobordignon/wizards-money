import 'package:flutter/foundation.dart';
import 'package:wizards_money/features/sign_up/sign_up_state.dart';
import 'package:wizards_money/services/auth_service.dart';
import 'package:wizards_money/services/secure_storage.dart';

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
    const secureStorage = SecureStorage();
    _changeState(SignUpLoadingState());
    
    try {
      final user = await _service.signUp(
        name: name,
        email: email, 
        password: password
      );
      if (user.id != null) {
        await secureStorage.write(
          key: "CURRENT_USER", 
          value: user.toJson(),
        );
        _changeState(SignUpSuccessState());
      } else {
        throw Exception();
      }     
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}