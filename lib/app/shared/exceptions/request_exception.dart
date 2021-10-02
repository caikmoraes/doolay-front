class RequestException implements Exception {
  String message = 'Erro ao realizar requisição';
  RequestException();

  @override
  String toString() => message;
}
