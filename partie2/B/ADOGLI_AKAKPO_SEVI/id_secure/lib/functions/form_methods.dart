bool isValidPhoneNumber(String value) {

  return value.length == 8 && RegExp(r'^[0-9]+$').hasMatch(value);
}

bool isValidEmail(String value) {

  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
}
