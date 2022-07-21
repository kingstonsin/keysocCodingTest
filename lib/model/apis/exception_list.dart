class ExceptionList implements Exception {
  final _message;
  final _prefix;

  ExceptionList([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ExceptionList {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ExceptionList {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ExceptionList {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends ExceptionList {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}