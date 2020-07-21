import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_login/src/ui/routes.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseApp app = await FirebaseApp.configure(
    name: 'flutterproduts',
    options: FirebaseOptions(
      googleAppID: (Platform.isIOS || Platform.isMacOS)
          ? '1:99026815550:ios:07b8a75938e6c476b89f6f'
          : '1:99026815550:android:f38fe819f2c4aaf9b89f6f',
      gcmSenderID: '99026815550',
      apiKey: (Platform.isIOS || Platform.isMacOS)
          ? '  AIzaSyAEBThfOkYQekkjMdYkeSPleqcTmpaGDrk'
          : 'AIzaSyAtDhUIR9UX-uwDc2kwscnNnKGQVXgOC6U',
      projectID: 'flutterproduts',
    ),
  );

  final FirebaseStorage storage = FirebaseStorage(
      app: app, storageBucket: 'gs://flutterproduts.appspot.com');
  runApp(MyApp(storage: storage));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp({this.storage});
  final FirebaseStorage storage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: [Locale('en'), Locale('es')],
      initialRoute: Routes.LOGIN,
      routes: Routes.getRoutes(),
    );
  }
}
