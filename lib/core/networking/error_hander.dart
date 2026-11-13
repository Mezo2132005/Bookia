import 'package:dio/dio.dart';

class ErrorHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout with API server";

        case DioExceptionType.sendTimeout:
          return "Send timeout with API server";

        case DioExceptionType.receiveTimeout:
          return "Receive timeout with API server";

        case DioExceptionType.badCertificate:
          return "Bad SSL certificate. Unable to verify the server's identity";

        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);

        case DioExceptionType.cancel:
          return "Request to API server was cancelled";

        case DioExceptionType.connectionError:
          return "Unable to connect to the server. Please check your internet connection";

        case DioExceptionType.unknown:
          return "Connection to API server failed due to an unexpected error";

        case DioExceptionType.transformTimeout:
          return "Timeout while processing the server response";
      }
    }

    // Non-Dio errors (parsing errors, etc.)
    return "Something went wrong";
  }

  static String _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode;

    // Try to read a message from the server's response body
    String? serverMessage;
    final data = response?.data;
    if (data is Map<String, dynamic>) {
      serverMessage = data['message']?.toString() ?? data['error']?.toString();
    }

    switch (statusCode) {
      case 400:
        return serverMessage ?? "Bad request";
      case 401:
        return serverMessage ?? "Unauthorized. Please log in again";
      case 403:
        return serverMessage ?? "Forbidden. You don't have permission";
      case 404:
        return serverMessage ?? "Resource not found";
      case 408:
        return "Request timeout";
      case 409:
        return serverMessage ?? "Conflict with the current state of the resource";
      case 422:
        return serverMessage ?? "Validation error";
      case 429:
        return "Too many requests. Please try again later";
      case 500:
        return "Internal server error";
      case 502:
        return "Bad gateway";
      case 503:
        return "Service unavailable. Please try again later";
      case 504:
        return "Gateway timeout";
      default:
        return serverMessage ?? "Received invalid status code: $statusCode";
    }
  }
}