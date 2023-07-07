import 'package:formz/formz.dart';

enum PhoneNumberValidationError {
  invalid(
      "Phone number is not valid. Phone numbers need to have exactly 10 numbers.");

  const PhoneNumberValidationError(this.message);

  final String message;
}

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure() : super.pure('');

  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  // static final _passwordRegExp = RegExp(
  //     r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');

  @override
  PhoneNumberValidationError? validator(String? value) {
    return value == null || value == "" || value.length != 10
        ? PhoneNumberValidationError.invalid
        : null;
    // return value == null || value.length < 6
    //     ? PasswordValidationError.invalid
    //     : null;
  }
}
