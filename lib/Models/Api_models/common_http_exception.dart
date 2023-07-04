class CommonHttpException implements Exception {
  final String? message;

  CommonHttpException(this.message);

  @override
  String toString() {
    return message!;
  }
}
