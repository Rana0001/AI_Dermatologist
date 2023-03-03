import 'package:ai_dermatologist/utils/app_routes.dart';
import 'package:ai_dermatologist/utils/constants/app_page_names.dart';
import 'package:ai_dermatologist/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAVF51v6U7bbP26XZcHQxz-UwmmfXtn7Vs",
      appId: "1:545607250893:android:6bad93434f82a6f976ca84",
      messagingSenderId: "XXX",
      projectId: "ai-dermatologist-d4f8e",
    ),
  );
  runApp(const AiDermatologist());
}

class AiDermatologist extends StatelessWidget {
  const AiDermatologist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ai Dermatologist',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouteGenerator.generateRoute,
      initialRoute: AppPageNames.rootScreen,
      theme: AppThemeData.appThemeData,
    );
  }
}
