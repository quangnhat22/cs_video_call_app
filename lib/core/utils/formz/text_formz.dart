import 'package:formz/formz.dart';

enum TextValidationError {
  empty("Not be empty");

  const TextValidationError(this.message);

  final String message;
}

class TextFormz extends FormzInput<String, TextValidationError> {
  const TextFormz.pure() : super.pure('');

  const TextFormz.dirty([super.value = '']) : super.dirty();

  @override
  TextValidationError? validator(String? value) {
    return (value == null || value.isEmpty || value == "")
        ? TextValidationError.empty
        : null;
  }
}
