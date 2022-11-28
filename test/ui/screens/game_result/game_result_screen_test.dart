import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/game_result/game_result_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';

void main() {
  testWidgets('should show correct answers count', (tester) async {
    await tester.pumpWidget(
      TestUtils.createWidgetForTesting(
        child: GameResultScreen(
          gameResults: [
            RoundResult(
              round: Round(
                dog: Dog(
                  id: "",
                  imageUrl: "imageUrl",
                  breed: Breed(name: ""),
                ),
                answers: [],
              ),
              answer: Breed(name: ""),
            ),
            RoundResult(
              round: Round(
                dog: Dog(
                  id: "",
                  imageUrl: "imageUrl",
                  breed: Breed(name: ""),
                ),
                answers: [],
              ),
              answer: Breed(name: ""),
            ),
          ],
        ),
      ),
    );

    expect(find.text('2 / 2'), findsOneWidget);
  });

  testWidgets('should show PLAY AGAIN! button', (tester) async {
    await tester.pumpWidget(
      TestUtils.createWidgetForTesting(
        child: const GameResultScreen(
          gameResults: [],
        ),
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CupertinoButton &&
            (widget.child as Text).data == "PLAY AGAIN!",
      ),
      findsOneWidget,
    );
  });
}
