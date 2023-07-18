import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:videocall/core/di/injector.dart' as di;
import 'package:videocall/core/utils/check_permission.dart';
import 'package:videocall/data/models/user_model.dart';
import 'package:videocall/presentation/app/app.dart';

import 'app_bloc_observer.dart';
import 'core/config/firebase_options.dart';
import 'data/data_sources/remote/base_servie.dart';
import 'services/notification_service.dart';

void main() async {
  await _initialize();
  await _initLocalNotification();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const App());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCheckPermission.checkPermissions();

  Bloc.observer = AppObserver();

  await Firebase.initializeApp(
    name: "CS Video call App",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  _registerAdapterHive();
  await di.configureDependencies();
}

void _registerAdapterHive() {
  Hive.registerAdapter(UserModelAdapter());
}

Future<void> _initLocalNotification() async {
  await NotificationService.initializeLocalNotifications(debug: true);
  await NotificationService.initializeRemoteNotifications(debug: true);
}
