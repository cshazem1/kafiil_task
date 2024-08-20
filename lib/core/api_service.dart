import 'package:dio/dio.dart';

class ApiService{
  final _baseUrl="https://test.kafiil.com/";
Dio dio;

  ApiService({required this.dio});

  Future<Map<String,dynamic>>post({required String endPoint,Object? body,Map<String,dynamic>? headers}) async {

    var response=await dio.post(_baseUrl+endPoint,data:body,options: Options(headers: headers), );
print(response);
    return response.data;
  }

  Future<Map<String, dynamic>>get({required String endPoints})
  async {

    {

      var response = await dio.get(_baseUrl + endPoints);
print(response);
      return response.data;
    }
  }

  Future<Map<String, dynamic>>getToken({required String endPoints,String?token})
  async {
    print("EWFV$token");

    {
      token!=null? dio.options.headers['Authorization'] = token:null;

      print(token);
      var response = await dio.get(_baseUrl + endPoints);
      print(response);
      return response.data;
    }
  }
}