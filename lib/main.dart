import 'package:testflutter/app/resources/language_manager.dart';
import 'package:testflutter/presentation/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [englishLocal, vietnamLocal],
    path: assetsPathLocalizations,
    fallbackLocale: englishLocal,
    child: const App(),
  ));
}
