class InputValidator {
  /// Check on the correctness of entering the email and the length of the password
  static String authValidator(
    String email,
    String password,
  ) {
    // Regular expression for checking the email format
    const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(pattern);

    // Checking the correspondence of the email to the regular expression
    if (!regExp.hasMatch(email)) {
      return "Неверный формат электронной почты";
    }
    // Password length is checked, if the length is less than 5, then an error occurs
    else if (password.length < 5) {
      return "Слишком короткий пароль";
    } else {
      return "";
    }
  }
}
