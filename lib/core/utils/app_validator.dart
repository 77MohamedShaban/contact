abstract class AppValidator {
  static String? emailValidator(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }

    final RegExp regex = RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    );

    if (!regex.hasMatch(email)) {
      return 'Invalid Email Address';
    }

    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Name is required';
    }

    if (name.length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }

  static String? phoneValidator(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return 'Phone number is required';
    }

    // Egyptian phone number format (010, 011, 012, 015) followed by 8 digits
    final RegExp egyptPhoneRegex = RegExp(r'^01[0125][0-9]{8}$');

    if (!egyptPhoneRegex.hasMatch(phone)) {
      return 'Invalid Egyptian phone number';
    }

    return null;
  }
}
