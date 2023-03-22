class ApiException implements Exception {
  final String msg;

  ApiException({required this.msg});
}
