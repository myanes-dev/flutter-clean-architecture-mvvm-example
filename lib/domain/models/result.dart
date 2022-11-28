import 'package:flutter_clean_architecture_2022/domain/models/app_error.dart';

class Result<T> {
  final bool success;
  final AppError? error;
  final String? msg;
  final T? value;

  Result(this.success, {this.error, this.msg, this.value});
}
