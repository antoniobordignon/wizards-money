import 'package:get_it/get_it.dart';
import 'package:wizards_money/features/sign_in/sign_in_controller.dart';
import 'package:wizards_money/features/sign_up/sign_up_controller.dart';
import 'package:wizards_money/services/auth_service.dart';
import 'package:wizards_money/services/firebase_auth_service.dart';

final locator =GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SignInController>(
    () => SignInController(locator.get<AuthService>())
  );
  
  locator.registerFactory<SignUpController>(
    () => SignUpController(locator.get<AuthService>())
  );
}