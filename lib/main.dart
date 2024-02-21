import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurant_demo_app/config/root_binding/root_binding.dart';
import 'package:restaurant_demo_app/screen/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_demo_app/screen/main_Screen/main_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restaurant APP',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
          fontFamily: "Inter"),
      debugShowCheckedModeBanner: false,
      initialBinding: RootBinding(),
      home: const MainScreen(),
    );
  }
}
