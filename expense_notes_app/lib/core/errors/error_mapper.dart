import 'package:dio/dio.dart';
import 'failures.dart';

class ErrorMapper {
  // Maps Dio errors Failure
  static Failure fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutFailure();

      case DioExceptionType.connectionError:
        return const NoInternetFailure();

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 401:
            return const UnauthorizedFailure();
          case 404:
            return ServerFailure('Resource not found', statusCode: 404);
          case 500:
            return ServerFailure(
              'Server error, try again later',
              statusCode: 500,
            );
          default:
            return ServerFailure(
              'Unexpected error ($statusCode)',
              statusCode: statusCode,
            );
        }

      default:
        return ServerFailure(e.message ?? 'Unknown network error');
    }
  }

  // Maps DB errors Failure
  static Failure fromDbError(Object e) {
    final message = e.toString().toLowerCase();

    if (message.contains('unique constraint')) {
      return const DbWriteFailure('Record already exists');
    }
    if (message.contains('foreign key')) {
      return const DbWriteFailure('Related record not found');
    }
    if (message.contains('not found') || message.contains('no such')) {
      return const DbNotFoundException('Record not found in database');
    }
    return DbReadFailure('Database error: $e');
  }

  // Maps Failure → user-friendly toast message
  static String toUserMessage(Failure failure) {
    return failure.message;
  }
}
