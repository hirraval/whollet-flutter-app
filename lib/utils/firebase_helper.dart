import 'dart:async';

import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:retry/retry.dart';

const _vapidKey = "BNeRQLugpYCLIfmEzNOL-3ovw9ZgZzvo2n-m_EAOCrREfvpsHnlsaB0DS4ibh9GhfEYmgrr1hQQ4XyUBj_YWelk";

class FirebaseHelper {
  FirebaseHelper();

  late final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initializeApp() async {
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    getToken().then((value) => "FirebaseHelper.token => $value".debug());
  }

  Future<String?> getToken() {
    return retry(
          () => _messaging.getToken(vapidKey: _vapidKey),
      retryIf: (exception) => exception is PlatformException,
      maxAttempts: 3,
      delayFactor: const Duration(milliseconds: 100),
    ).onError((error, stackTrace) {
      "FirebaseHelper.token -> $error".error();
      return null;
    });
  }

  void subscribeTopic(String topic) {
    if (kIsWeb) return;
    _messaging.subscribeToTopic(topic);
  }

  Future<void> deleteToken() {
    return _messaging.deleteToken();
  }

  Future<void> setCrashlyticsCollectionEnabled([bool enabled = true]) async {
    return FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(enabled);
  }

  Future<void> recordFlutterError(FlutterErrorDetails errorDetails) async {
    return FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  }

  Future<void> recordError(dynamic error, StackTrace stackTrace) async {
    return FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  Future<RemoteMessage?> getInitialMessage() {
    return _messaging.getInitialMessage();
  }

  StreamSubscription<RemoteMessage> onMessage(void Function(RemoteMessage message) listener) {
    return FirebaseMessaging.onMessage.listen(listener);
  }

  StreamSubscription<RemoteMessage> onMessageOpenedApp(void Function(RemoteMessage message) listener) {
    return FirebaseMessaging.onMessageOpenedApp.listen(listener);
  }
}
