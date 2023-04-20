import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:videocall/core/di/injector.dart' as di;
import 'package:videocall/presentation/app/app.dart';

import 'core/config/firebase_options.dart';

void main() async {
  await _initialize();
  runApp(const App());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await di.configureDependencies();
}
