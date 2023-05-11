import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:videocall/core/di/injector.dart' as di;
import 'package:videocall/presentation/app/app.dart';

import 'app_bloc_observer.dart';
import 'core/config/firebase_options.dart';
import 'core/services/notification_controller.dart';

const _useEmulator = true;

void main() async {
  await _initialize();
  await _initLocalNotification();
  runApp(const App());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // .dev
  if (_useEmulator) {
    await _connectToFirebaseEmulator();
  }

  await Hive.initFlutter();
  await di.configureDependencies();
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

Future<void> _initLocalNotification() async {
  // Initialize cho Local Notification
  await NotificationController.initializeLocalNotifications(debug: true);

  // Initialize cho Push Notification
  await NotificationController.initializeRemoteNotifications(debug: true);
}
