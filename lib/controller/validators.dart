class Validator {
  static String? validateName({required String? name}) {
    if (name == null || name.trim().isEmpty) {
      return 'Name can\'t be empty';
    } else if (name.trim().length < 3) {
      return 'Enter a password with length at least 3';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email == null || email.trim().isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null || password.trim().isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 8) {
      return 'Enter a password length at least 8';
    }

    return null;
  }
}