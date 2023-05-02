import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:videocall/core/di/injector.dart' as di;
import 'package:videocall/presentation/app/app.dart';

import 'app_bloc_observer.dart';
import 'core/config/firebase_options.dart';

void main() async {
  await _initialize();
  runApp(const App());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  // .dev
  Bloc.observer = AppObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // .dev
  //await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);
  await Hive.initFlutter();
  await di.configureDependencies();
}
