import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐶 Dogs Care 🐶'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: themeData.colorScheme.background,
      ),
      body: const Center(
        child: Text('HOME SCREEN'),
      ),
    );
  }
}
