class ServiceNotFoundException implements Exception {
  String errMsg;

  ServiceNotFoundException(this.errMsg);
}
