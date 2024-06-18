class CustomValidators {
  static String? emailValidator(String? value) {
    final emailRegex = RegExp(
      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
    );

    if (value != null) {
      if (value.isEmpty) {
        return 'Please, enter your email.';
      }
      if (!emailRegex.hasMatch(value)) {
        return 'Oops! It seems that you did not write your email correctly.';
      }
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    final passwordRegex = RegExp(
      r"^.{6,}$",
    );
    if (value != null) {
      if (value.isEmpty) {
        return 'Please enter your password.';
      }
      if (!passwordRegex.hasMatch(value)) {
        return 'Passwords need to be a minimum of 6 characters.';
      }
    }
    return null;
  }
}
