import 'package:dio/dio.dart';

class ApiService {
  static Dio? dio;
  static init() {
     dio =  Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,

    ));
  }
  static Future<Response?> get(
      {
        required String url,
         Map<String,dynamic>? query,
        String? lang='en',
        String? token,
      }) async {
    dio?.options.headers= {
          'lang':lang,
          'Authorization':token,
          'Content-Type':'application/json',
        };

    return await dio?.get(url, queryParameters:  query);


  }


  static Future<Response?> post(
      {
        required String url,
         Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String? lang='en',
        String? token,
      }) async {
    dio?.options.headers= {
      'lang':lang,
      'Authorization':token,
      'Content-Type':'application/json',
    };
    return  dio?.post(url, queryParameters:  query,data:data );


  }

  static Future<Response?> put(
      {
        required String url,
        Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String? lang='en',
        String? token,
      }) async {
    dio?.options.headers= {
      'lang':lang,
      'Authorization':token,
      'Content-Type':'application/json',
    };
    return  dio?.put(url, queryParameters:  query,data:data );

  }

  
  Future<Response> stripePost(
      {required body,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio?.post(url,
        data: body,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"}, 
        ));

    return response!;
  }
}
