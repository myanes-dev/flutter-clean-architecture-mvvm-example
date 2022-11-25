import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_clean_architecture_2022/core/config/di.dart';
import 'package:flutter_clean_architecture_2022/ui/const/themes.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/home/home_screen.dart';

void main() async {
  await _init();
  runApp(const MyApp());
}

Future _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDI();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dogs Care',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      home: const HomeScreen(),
    );
  }
}
