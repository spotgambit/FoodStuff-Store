import 'package:intl/intl.dart';

class StringFormatHelper {
  static String formatCreditCardExpiryDate(String expiryDate) {
    // Remove any existing slashes or spaces
    expiryDate = expiryDate.replaceAll(RegExp(r'[/\s]'), '');

    if (expiryDate.length == 4) {
      return '${expiryDate.substring(0, 2)}/${expiryDate.substring(2, 4)}';
    } else if (expiryDate.length == 2) {
      return '${expiryDate.substring(0, 2)}/';
    }

    return expiryDate;
  }

  static bool isValidCVV(String cvv, {int length = 3}) {
    // Ensure the CVV contains only digits and is of the correct length
    return RegExp(r'^\d{3,4}$').hasMatch(cvv) && cvv.length == length;
  }

  static bool isValidCreditCardExpiryDate(String expiryDate) {
    // Ensure the format is correct: MM/YY
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(expiryDate)) {
      return false;
    }

    final parts = expiryDate.split('/');
    int month = int.parse(parts[0]);
    int year = int.parse('20${parts[1]}');

    // Check that the month is between 01 and 12
    if (month < 1 || month > 12) {
      return false;
    }

    // Get the current date
    DateTime now = DateTime.now();

    // Check that the expiry date is not in the past
    if (year < now.year || (year == now.year && month < now.month)) {
      return false;
    }

    return true;
  }

  static String formatCardNumber(String cardNumber) {
    // Remove any existing spaces
    cardNumber = cardNumber.replaceAll(' ', '');

    // Split the card number into groups of 4 digits
    List<String> groups = [];
    for (int i = 0; i < cardNumber.length; i += 4) {
      groups.add(cardNumber.substring(i, i + 4 > cardNumber.length ? cardNumber.length : i + 4));
    }

    // Join the groups with a space separator
    return groups.join(' ');
  }

  static bool isValidCreditCardNumber(String cardNumber) {
    cardNumber = cardNumber.trim();
    final numPattern = RegExp(r'^\d{16,18}$');
    return numPattern.hasMatch(cardNumber);
  }

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

  static String formatObscureContactInfo(String input) {
    // Check if the input is an email
    if (input.contains('@')) {
      return formatToObscureEmail(input);
    } else {
      return formatToObscureNigerianPhoneNumber(input);
    }
  }

  static String formatToObscureEmail(String email) {
    // Find the index of the "@" character
    int atIndex = email.indexOf('@');

    // Get the first 4 characters and the domain
    String firstFour = email.substring(0, 4);
    String domain = email.substring(atIndex);

    // Return the formatted email
    return '$firstFour****$domain';
  }

  static String formatToObscureNigerianPhoneNumber(String phone) {
    // Remove the leading zero if present
    if (phone.startsWith('0')) {
      phone = phone.substring(1);
    }

    // Extract the required parts of the phone number
    String firstTwo = phone.substring(0, 2);
    String lastTwo = phone.substring(phone.length - 2);

    // Return the formatted phone number
    return '+234 $firstTwo*****$lastTwo';
  }

  static final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'en_NG',
    symbol: '₦',
    decimalDigits: 2,
  );

  static String formatBalance(num value) {
    return _currencyFormat.format(value);
  }

  static String formatBalanceLite(num value, {bool showCurrency = true, int decimalPlaces = 0}) {
    NumberFormat currencyFormatLite = NumberFormat.currency(
      locale: 'en_NG',
      symbol: showCurrency ? '₦' : '',
      decimalDigits: decimalPlaces,
    );
    return currencyFormatLite.format(value);
  }

  static bool isNullOrEmpty(String? str) {
    return str == null || str.isEmpty;
  }
}
