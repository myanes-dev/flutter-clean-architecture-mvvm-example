import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/home/play_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_clean_architecture_2022/core/config/di.dart';
import 'package:flutter_clean_architecture_2022/ui/const/themes.dart';

void main() async {
  _init();
  runApp(const MyApp());
}

void _init() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDI();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dogs Games',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      home: PlayScreen(),
    );
  }
}
