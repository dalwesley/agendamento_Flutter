import 'dart:io';
import 'package:flutter/material.dart';
import 'android/android.app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

// void main() => runApp(MyApp());
void main() {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
  } else {
    runApp(AndroidApp());
  }
}
