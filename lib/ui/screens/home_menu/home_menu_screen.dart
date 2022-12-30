import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/history/history_results_screen.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/play/play_screen.dart';
import 'package:get/get.dart';

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.MARGIN_M),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  child: const Text(
                    'PLAY!',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Get.to(
                      () => PlayScreen(),
                    );
                  },
                ),
              ),
              const SizedBox(height: Dimens.MARGIN_M),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  child: const Text(
                    'HISTORY',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Get.to(
                      () => HistoryResultsScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
