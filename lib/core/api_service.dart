import 'package:dio/dio.dart';

class ApiService{
  final _baseUrl="https://test.kafiil.com/";
Dio dio;

  ApiService({required this.dio});

  Future<Map<String,dynamic>>post({required String endPoint,Object? body,Map<String,dynamic>? headers}) async {

    var response=await dio.post(_baseUrl+endPoint,data:body,options: Options(headers: headers), );

    return response.data;
  }

  Future<Map<String, dynamic>>get({required String endPoints})
  async {
 var response= await  dio.get(_baseUrl+endPoints);
 return response.data;


  }

}