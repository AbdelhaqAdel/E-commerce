import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServicesError extends Failure {
  ServicesError(super.errMessage);

  factory ServicesError.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServicesError('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServicesError('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServicesError('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServicesError(' badCertificate Error, Please try again');
      case DioExceptionType.badResponse:
        return ServicesError.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServicesError('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServicesError('No Internet Connection');
      case DioExceptionType.unknown:
        return ServicesError('unknown Error, Please try again!');
      default:
        return ServicesError('Opps There was an Error, Please try again');
    }
  }

  factory ServicesError.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServicesError(response['error']['message']);
    } else if (statusCode == 404) {
      return ServicesError('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServicesError('Internal Server error, Please try later');
    } else {
      return ServicesError('Opps There was an Error, Please try again');
    }
  }
}
