import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tutorialapp/common/utilities/constants.dart';
import 'package:tutorialapp/global.dart';

class HttpUtil {
  late Dio dio;

  // this make the class a private class
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 100),
      receiveTimeout: const Duration(seconds: 100),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);
    //please make sure you put this in your code so you will know //
    // if there is any error in your code //

    // dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    //   print("app request  data ${options.data}");
    //   return handler.next(options);
    // }, onResponse: (response, handler) {
    //   // print("app response data ${response.data}");
    // }, onError: (DioException e, handler) {
    //   if (kDebugMode) {
    //     print("app error data $e");
    //   }
    //   ErrorEntity eInfo = createErrorEntity(e);
    //   onError(eInfo);
    // }));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = global.storageService.getUserToken();
    print(accessToken);

    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    print("done with headers");
    var response = await dio.post(path,
        data: data, //sending the data back to the backend //
        queryParameters: queryParameters,
        options: requestOptions);
    print("done with data{$response");
    return response.data;
  }
}

//errror entity to debug error
class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "connection timeout");
    case DioExceptionType.sendTimeout:
      // TODO: Handle this case.
      return ErrorEntity(code: -1, message: "send timeout");
    case DioExceptionType.receiveTimeout:
      // TODO: Handle this case.
      return ErrorEntity(code: -1, message: "receive timeout");
    case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      return ErrorEntity(code: -1, message: "certificate timeout");
    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "request syntax error");

        case 401:
          return ErrorEntity(code: 401, message: "permission denied");
      }
      // TODO: Handle this case.
      return ErrorEntity(code: -1, message: "response timeout");
    case DioExceptionType.cancel:
      // TODO: Handle this case.
      return ErrorEntity(code: -1, message: "Exception error");
    case DioExceptionType.connectionError:
      // TODO: Handle this case.
      return ErrorEntity(code: -1, message: "connection error");
    case DioExceptionType.unknown:
      // TODO: Handle this case.
      return ErrorEntity(code: -1, message: "unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  print('error.code ->${eInfo.code}, error.message -> ${eInfo.message}');
  switch (eInfo.code) {
    case 400:
      print("server syntax error");
      break;
    case 401:
      print("you are denied to continue");
      break;
    case 500:
      print("Internal Server Error");
      break;
    default:
      print("unknown error");
      break;
  }
}
