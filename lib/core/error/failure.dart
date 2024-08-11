import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class Failure{

  String? message;
  Failure({ this.message});

}
class ServerFailure extends Failure{
  ServerFailure({required super.message});
 factory ServerFailure.fromDioError(DioException dioException){

switch(dioException.type)
{
  case DioExceptionType.connectionTimeout:

return ServerFailure(message: "Connection Time Out With Api");
  case DioExceptionType.sendTimeout:
    return ServerFailure(message: "sendTimeout With Api");
  case DioExceptionType.receiveTimeout:
    return ServerFailure(message: "sendTimeout With Api");
  case DioExceptionType.badCertificate:
    return ServerFailure(message: "badCertificate With Api");
  case DioExceptionType.badResponse:
  return  ServerFailure.fromBadResponse(dioException.response!.statusCode!,dioException.response?.data);
  case DioExceptionType.cancel:
  return ServerFailure(message: "cancel With Api");
  case DioExceptionType.connectionError:
    return ServerFailure(message: "connectionError With Api");
  case DioExceptionType.unknown:
    if(dioException.message?.contains("SocketException")??false) {
      return ServerFailure(message: "no internet");
    } else {
      return ServerFailure(message: "error");
    }

  default:   return ServerFailure(
      message: "Ops There was an Error ,please try again");
}
}
  factory ServerFailure.fromBadResponse(int statusCode, dynamic badResponse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 422) {
      final errorMessage;
      if(badResponse['errors']!=null)
        {
          Map errors= badResponse['errors'];
           errorMessage=errors.entries.map((e) {
            final value=e.value;
            final key=e.key;
            return "${value.join(' , ')}";
          },).join('\n\n');
        }
      else errorMessage=badResponse['error']['message'];


      return ServerFailure(message: errorMessage);
    } else if (statusCode == 404) {
      return ServerFailure(message: "Method not Found");
    } else if (statusCode == 500) {
      return ServerFailure(message: "Internal Server Error, please try again ");
    } else {
      return ServerFailure(message: "Ops There was an Error ,please try again");
    }
  }

  }
