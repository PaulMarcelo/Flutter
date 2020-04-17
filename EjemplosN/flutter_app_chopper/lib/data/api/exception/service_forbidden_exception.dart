class ServiceForbiddenException implements Exception {
  String errMsg;

  ServiceForbiddenException(this.errMsg);
}
