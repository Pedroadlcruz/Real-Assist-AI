import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_assit_ai/real_assist_app.dart';

void main() async {
  await setupAppSystemPreferrence();
  runApp(const RealAssistApp());
}

Future<void> setupAppSystemPreferrence() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
