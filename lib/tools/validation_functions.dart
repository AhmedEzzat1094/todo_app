String? isEmpty(String value,[String? errMessage]) {
  if (value.isEmpty) {
    return errMessage ?? "";
  }
  return null;
}

bool isDigits(String value) {
  if (RegExp(r"^[\d]+$").hasMatch(value)) {
    return true;
  }
  return false;
}

bool validMinute(String value) {
  if (RegExp(r"^(0?[0-9]|[1-5][0-9])$").hasMatch(value)) {
    return true;
  }
  return false;
}

bool validHour(String value) {
  if (RegExp(r"^(0?[1-9]|1[0-2])$").hasMatch(value)) {
    return true;
  }
  return false;
}

bool isValid(String hour, String minute) {
  return (validHour(hour) && validMinute(minute)) ? true : false;
}
