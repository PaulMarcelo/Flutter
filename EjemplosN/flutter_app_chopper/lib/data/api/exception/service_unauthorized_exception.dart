class ServiceUnauthorizedException implements Exception {
  String errMsg;

  ServiceUnauthorizedException(this.errMsg);
}
