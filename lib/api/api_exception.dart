enum ErrorType { clientError, serverError, noInternet, timeOut }

class ApiException implements Exception {
  final ErrorType errorType;
  final String? error;

  ApiException({required this.errorType, this.error});

  @override
  String toString() {
    final details = error == null ? '' : '$error';
    switch (errorType) {
      case ErrorType.clientError:
        return 'Ошибка со стороны клиента: $details';
      case ErrorType.serverError:
        return 'Ошибка со стороны сервера: $details';
      case ErrorType.noInternet:
        return 'Нет интернета: $details';
      case ErrorType.timeOut:
        return 'Сервер не ответил вовремя: $details';
    }
  }
}
