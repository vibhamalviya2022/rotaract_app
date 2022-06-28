import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_app/provider/providerNotifier.dart';
import 'package:rotaract_app/constant/constant.dart' as cnst;
import 'Screen/home_page.dart';
import 'Screen/login_signup_screen/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderNotifier()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      theme: ThemeData(primarySwatch: Colors.pink),
    ),
  ));
}
