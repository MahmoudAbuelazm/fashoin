import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/shared_pref_helper.dart';
import 'api_constants.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      createDioInstance(dio);
      return dio!;
    } else {
      return dio!;
    }
  }

  static createDioInstance(dio) {
    Map<String, dynamic> headers = {
      'Accept-Language': CacheServices.instance.getLangCode(),
    };

    dio.options =
        BaseOptions(baseUrl: ApiConstants.apiBaseUrl, headers: headers);

    /// SSL Pinning in production mode
    ///
    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   /// SSL Pinning in production mode
    //   if (AppConfig.appMode == AppMode.PROD) {
    //     final certBytes = base64Decode(Endpoints.CERTIFICATE);
    //     final SecurityContext context = SecurityContext();
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => false;
    //     context.setTrustedCertificatesBytes(certBytes);

    //     return HttpClient(context: context);
    //   } else {
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;

    //     return client;
    //   }
    // };

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      //// refresh token work

      // if (  CacheServices.instance.getUserModel() != null) {
      //   UserData? userModel = CacheServices.instance.getUserModel();
      //   if (userModel != null) {
      //     log(userModel.token!, name: 'Authorization token');
      //     // options.headers['token'] = "${userModel.data.token}";
      //     // headers['token'] = "${userModel.data.token}";
      //     options.headers['token'] = userModel.token!;
      //   }
      // }
      dio.options =
          BaseOptions(baseUrl: ApiConstants.apiBaseUrl, headers: headers);
      // options.headers = headers;

      handler.next(options); // modify your request
    }, onResponse: (response, handler) {
      // If the call to handler.next(response) is not made, the response won't proceed to the next step.
      if (response.statusCode! < 300) {
        return handler.next(response); // Everything's good, continue as usual.
      } else {
        // DioError can be thrown with any custom message or the message from the backend
        // String? errorMessage = response.data["message"] ??
        //     "Received invalid status code: ${response.statusCode}";
        String? errorMessage =
            response.data['message'] ?? "something went wrong";
        handler.reject(DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: errorMessage,
          message: errorMessage,
          type: DioExceptionType.badResponse,
        ));
      }
// on success it is getting called here
    }, onError: (DioException e, handler) async {
      // String? errorMessage = e.response?.data["message"] ?? e.message;
      String? errorMessage =
          e.response?.data['msgError'] ?? "something went wrong";

      handler.reject(DioException(
          requestOptions: e.response?.requestOptions ?? RequestOptions(),
          response: e.response,
          error: errorMessage,
          message: errorMessage,
          type: e.type,
          stackTrace: e.stackTrace));

      /// refresh token
      // if (e.response != null) {
      //   if (e.response!.statusCode == 401) {
      //     //// new refresh token work start

      //     // final newToken = await newRefreshToken();
      //     // if (newToken != null) {
      //     //   dio.options.headers["Authorization"] = "Bearer " + newToken;
      //     //   return handler.resolve(await dio.fetch(e.requestOptions));
      //     // }

      //     //new refresh token work end
      //   } else if (e.response!.statusCode == 400) {
      //     return handler.resolve(e.response!);
      //   }

      //   // to many requests
      //   //  else if (e.response!.statusCode == 429) {
      //   //   _baseView != null
      //   //       ? _baseView?.showErrorMsg('Too Many Requests')
      //   //       : AppDefaultToast().showErrorMsg('Too Many Requests');
      //   //   return handler.next(e);
      //   // }

      //   else {
      //     return handler.next(e);
      //   }

      // }
    }));
    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    return dio;
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
