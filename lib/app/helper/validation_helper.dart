class ValidationHelper {
  static String? emailValidation(String? email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (email == null || email == "") {
      return "This field is required";
    } else if (!emailRegex.hasMatch(email)) {
      return "Invalid Email";
    }
    return null;
  }

  static String? nameValidation(String? name) {
    if (name == null || name == "") {
      return "This field is required";
    }
    return null;
  }

  static String? nrcValidation(String? nrc) {
    if (nrc == null || nrc.isEmpty) {
      return "This field is required";
    } else if (nrc.length != 4) {
      return "Last 4 characters required!";
    }

    return null;
  }
}
