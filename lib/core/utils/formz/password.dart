import 'package:formz/formz.dart';

enum PasswordValidationError {
  invalid(
      "Password needs at least 8 characters, at least one uppercase letter and at least one number");

  const PasswordValidationError(this.message);

  final String message;
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
    // return value == null || value.length < 6
    //     ? PasswordValidationError.invalid
    //     : null;
  }
}
