import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/core/config/di.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:flutter_clean_architecture_2022/ui/router/router.dart';

class HomeMenuScreen extends StatelessWidget {
  HomeMenuScreen({
    Key? key,
    AppRouter? router,
  })  : _router = router ?? getIt(),
        super(key: key);

  final AppRouter _router;

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
                    _router.to(context, AppRoute.play());
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
                    _router.to(context, AppRoute.historyResults());
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
