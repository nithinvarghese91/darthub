import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welcome/Handler.dart';
import 'package:welcome/screens/authPage.dart';
import 'package:welcome/screens/detailsScreen.dart';
import 'package:welcome/screens/lohin.dart';
import 'package:welcome/screens/newsScreen.dart';
import 'package:welcome/screens/otpScreen.dart';
import 'package:welcome/screens/searchScreen.dart';
import 'package:welcome/screens/splashScreen.dart';
import 'provider/demoProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

class MyApp extends StatelessWidget {
  @override//
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => DemoProvider(),
    builder: (context, _) {
    final  themeProvider = Provider.of<DemoProvider>(context);
      return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        //theme: ThemeData.dark(),
        //themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // theme: ThemeData.dark(),
      );}
    );
  }
}
