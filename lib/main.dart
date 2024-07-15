import 'package:firebase_core/firebase_core.dart';
import 'package:wizards_money/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:wizards_money/locator.dart';

import 'package:wizards_money/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  setupDependencies();
  runApp(const App());
}
