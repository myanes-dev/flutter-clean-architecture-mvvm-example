// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_clean_architecture_2022/test/ui/screens/history/history_results_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart'
    as _i6;
import 'package:flutter_clean_architecture_2022/domain/models/result.dart'
    as _i2;
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_history_usecase.dart'
    as _i5;
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_remove_usecase.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<T> extends _i1.SmartFake implements _i2.Result<T> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GameRemoveUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameRemoveUseCase extends _i1.Mock implements _i3.GameRemoveUseCase {
  MockGameRemoveUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<dynamic>> call(String? gameID) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [gameID],
        ),
        returnValue:
            _i4.Future<_i2.Result<dynamic>>.value(_FakeResult_0<dynamic>(
          this,
          Invocation.method(
            #call,
            [gameID],
          ),
        )),
      ) as _i4.Future<_i2.Result<dynamic>>);
}

/// A class which mocks [GameHistoryUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameHistoryUseCase extends _i1.Mock
    implements _i5.GameHistoryUseCase {
  MockGameHistoryUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<List<_i6.GameResult>>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<_i2.Result<List<_i6.GameResult>>>.value(
            _FakeResult_0<List<_i6.GameResult>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Result<List<_i6.GameResult>>>);
}
