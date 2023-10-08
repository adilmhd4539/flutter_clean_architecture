class CommonValidators {
  static String? emptyValidator(String filedName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your filed name';
    } else {
      return null;
    }
  }
}
