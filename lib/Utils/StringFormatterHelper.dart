class StringFormatHelper{
  static bool hasSpecialCharacter(String input) {
    final specialCharPattern = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return specialCharPattern.hasMatch(input);
  }

  static bool hasUppercase(String input) {
    final uppercasePattern = RegExp(r'[A-Z]');
    return uppercasePattern.hasMatch(input);
  }

  static bool isValidPhoneNumber(String input) {
    final phonePattern = RegExp(r'^\d{10,11}$');
    return phonePattern.hasMatch(input);
  }

  static bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  static String formatToObscureNigerianPhoneNumber(String phoneNumber) {
    if (phoneNumber[0] == '0') {
      phoneNumber = phoneNumber.substring(1);
    }

    String visibleStart = phoneNumber.substring(0, 2);
    String visibleEnd = phoneNumber.substring(phoneNumber.length - 2);
    String obscuredPart = '*' * (phoneNumber.length - 4); // Replace middle part with asterisks

    return '+234 $visibleStart$obscuredPart$visibleEnd';
  }

}