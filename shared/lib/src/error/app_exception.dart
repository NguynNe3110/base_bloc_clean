class AppException implements Exception {
  const AppException(this.message, {this.cause});

  final String message;
  final Object? cause;

  factory AppException.from(Object error) {
    if (error is AppException) return error;
    return AppException('Đã có lỗi xảy ra. Vui lòng thử lại.', cause: error);
  }

  @override
  String toString() => message;
}
