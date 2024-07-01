
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: const FirebaseOptions(
    apiKey: 'AIzaSyCcbTxaqxwC0iIT2CEfUFTCHKXHIvaADSU', // paste your api key here
    appId: '1:346647903797:android:e4d8e0aceee510190b7b7c', //paste your app id here
    messagingSenderId: '346647903797', //paste your messagingSenderId here
    projectId: 'newassignment-2475d',
    //paste your project id here
  ),);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}
