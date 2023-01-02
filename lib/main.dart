import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/data/database/hive/hive_client.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/home_menu/home_menu_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_clean_architecture_2022/core/config/di.dart';
import 'package:flutter_clean_architecture_2022/ui/const/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await _init();
  runApp(const MyApp());
}

Future _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDI();
  // Database init
  await Hive.initFlutter();
  initHiveAdapters();
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
      home: const HomeMenuScreen(),
    );
  }
}
