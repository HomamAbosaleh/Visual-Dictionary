import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:visual_dictionary/app/visual_dictionary.dart';
import 'package:visual_dictionary/di/locator.dart';
import 'package:visual_dictionary/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await setupLocator();
  runApp(const VisualDictionary());
}