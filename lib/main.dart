import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:videocall/core/di/injector.dart' as di;
import 'package:videocall/core/utils/check_permission.dart';
import 'package:videocall/data/models/user_model.dart';
import 'package:videocall/presentation/app/app.dart';

import 'app_bloc_observer.dart';
import 'core/config/firebase_options.dart';
import 'core/services/notification_service.dart';

const _useEmulator = false;

void main() async {
  await _initialize();
  await _initLocalNotification();
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

  // .dev
  if (_useEmulator) {
    await _connectToFirebaseEmulator();
  }

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

/// connect to the firebase emulator for Firestore and Authentication
Future<void> _connectToFirebaseEmulator() async {
  final localHostString = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  const authPort = 9099;
  const firestorePort = 8082;
  // const realtimeDbPort = 9000;
  // const functionsPort = 5001;
  const storagePort = 9199;

  await FirebaseAuth.instance.useAuthEmulator(localHostString, authPort);
  await FirebaseStorage.instance
      .useStorageEmulator(localHostString, storagePort);
  FirebaseFirestore.instance
      .useFirestoreEmulator(localHostString, firestorePort);
}

// overlay entry point
@pragma("vm:entry-point")
void overlayMain() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(child: Text("My overlay"))));
}
