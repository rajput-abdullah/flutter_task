import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/res/strings.dart';
import 'package:flutter_task/res/toasts.dart';
import 'models.dart';

class MyApi {
  // static Future<dynamic> callPostApi(
  //     {String url,
  //     dynamic body,
  //     Map<String, dynamic> parameters,
  //     Map<String, dynamic> myHeaders,
  //     dynamic modelName}) async {
  //   try {
  //     var dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if (connectivityResult != ConnectivityResult.none) {
  //       Response _response = await dio.post(url,
  //           options: Options(headers: myHeaders),
  //           data: body,
  //           queryParameters: parameters);
  //       switch (_response.statusCode) {
  //         case 200:
  //           dynamic modelobj = await Models.getModelObject(modelName, _response.data);
  //           if (modelobj.code == 1) {
  //             return modelobj;
  //           } else {
  //             Toasts.getErrorToast(text: modelobj.message);
  //           }
  //           return null;
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.noInternetError);
  //       return null;
  //     }
  //   } on DioError catch (ex) {
  //     if (ex.response != null) {
  //       switch (ex.response.statusCode) {
  //         case 400:
  //           Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //           return null;
  //         case 401:
  //           Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //           return null;
  //
  //     // if(ex.response?.data == ""){
  //           //   dynamic modelobj;
  //           //   await RefreshToken().onRefreshTokenApi().
  //           //   then((value) async{
  //           //     if(value) {
  //           //       Map<String, dynamic> header = {
  //           //         "Content-Type": "application/json",
  //           //         'Authorization': PreferenceUtils.getToken()
  //           //       };
  //           //       modelobj = await callPostApi(
  //           //           parameters: parameters,
  //           //           modelName: modelName,
  //           //           body: body,
  //           //           url: url,
  //           //           myHeaders: header
  //           //       );
  //           //       return modelobj;
  //           //     }
  //           //   });
  //           //   return modelobj;
  //           // }
  //           // else{
  //           //   Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //           //   return null;
  //           // }
  //
  //         case 500:
  //           Toasts.getErrorToast(text: "Internal Server Error");
  //           return null;
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.badHappenedError);
  //     }
  //   } on Exception {
  //     Toasts.getErrorToast(text: Strings.badHappenedError);
  //     return null;
  //   }
  // }

  static Future<dynamic> callGetApi(
      {String ?url,
      Map<String, dynamic>? parameters,
      Map<String, dynamic> ?myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response _response = await dio.get(url!,
            options: Options(headers: myHeaders), queryParameters: parameters);
        switch (_response.statusCode) {
          case 200:
            dynamic getModelObj = await Models.getModelObject(modelName, _response.data);
            // if (getModelObj.code == 1) {
              return getModelObj;
            // } else {
            //   Toasts.getErrorToast(text: getModelObj.message);
            // }
            // return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: "No internet");
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        switch (ex.response?.statusCode) {
          case 400:
            Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
            return null;
          case 401:
            Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
            return null;
          case 500:
            Toasts.getErrorToast(text: "Internal Server Error");
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return;
    }
  }

  // static Future<dynamic> callPutApi(
  //     {String? url,
  //     dynamic body,
  //     Map<String, dynamic>? parameters,
  //     Map<String, dynamic>? myHeaders,
  //     dynamic modelName}) async {
  //   try {
  //     var dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if (connectivityResult != ConnectivityResult.none) {
  //       Response _response = await dio.put(url!,
  //           options: Options(headers: myHeaders),
  //           data: body,
  //           queryParameters: parameters);
  //       switch (_response.statusCode) {
  //         case 200:
  //           dynamic modelobj =
  //               await Models.getModelObject(modelName, _response.data);
  //           if (modelobj.code == 1) {
  //             return modelobj;
  //           } else {
  //             Toasts.getErrorToast(text: modelobj.message);
  //           }
  //           return null;
  //
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.noInternetError);
  //       return null;
  //     }
  //   } on DioError catch (ex) {
  //     if (ex.response != null) {
  //       switch (ex.response!.statusCode) {
  //         case 400:
  //           Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //           return null;
  //         case 401:
  //           if(ex.response?.data == ""){
  //             dynamic modelobj;
  //             await RefreshToken().onRefreshTokenApi().
  //             then((value) async{
  //               if(value) {
  //                 Map<String, dynamic> header = {
  //                   "Content-Type": "application/json",
  //                   'Authorization': PreferenceUtils.getToken()
  //                 };
  //                 modelobj = await callPutApi(
  //                     parameters: parameters,
  //                     modelName: modelName,
  //                     body: body,
  //                     url: url,
  //                     myHeaders: header
  //                 );
  //                 return modelobj;
  //               }
  //             });
  //             return modelobj;
  //           }
  //           else{
  //             Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //             return null;
  //           }
  //         case 500:
  //           Toasts.getErrorToast(text: "Internal Server Error");
  //           return null;
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.badHappenedError);
  //     }
  //   } on Exception {
  //     Toasts.getErrorToast(text: Strings.badHappenedError);
  //     return null;
  //   }
  // }
  //
  // //   Delete
  // static Future<dynamic> callDeleteApi(
  //     {String? url,
  //     dynamic body,
  //     Map<String, dynamic>? parameters,
  //     Map<String, dynamic>? myHeaders,
  //     dynamic modelName}) async {
  //   try {
  //     var dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if (connectivityResult != ConnectivityResult.none) {
  //       Response _response = await dio.delete(url!,
  //           options: Options(headers: myHeaders),
  //           data: body,
  //           queryParameters: parameters);
  //       switch (_response.statusCode) {
  //         case 200:
  //           dynamic modelobj =
  //               await Models.getModelObject(modelName, _response.data);
  //           if (modelobj.code == 1) {
  //             return modelobj;
  //           } else {
  //             Toasts.getErrorToast(text: modelobj.message);
  //           }
  //           return null;
  //
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.noInternetError);
  //       return null;
  //     }
  //   } on DioError catch (ex) {
  //     if (ex.response != null) {
  //       switch (ex.response!.statusCode) {
  //         case 400:
  //           Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //           return null;
  //         case 401:
  //           if(ex.response?.data == ""){
  //             dynamic modelobj;
  //             await RefreshToken().onRefreshTokenApi().
  //             then((value) async{
  //               if(value) {
  //                 Map<String, dynamic> header = {
  //                   "Content-Type": "application/json",
  //                   'Authorization': PreferenceUtils.getToken()
  //                 };
  //                 modelobj = await callDeleteApi(
  //                     parameters: parameters,
  //                     modelName: modelName,
  //                     url: url,
  //                     body: body,
  //                     myHeaders: header
  //                 );
  //                 return modelobj;
  //               }
  //             });
  //             return modelobj;
  //           }
  //           else{
  //             Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //             return null;
  //           }
  //         case 500:
  //           Toasts.getErrorToast(text: "Internal Server Error");
  //           return null;
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.badHappenedError);
  //     }
  //   } on Exception {
  //     Toasts.getErrorToast(text: Strings.badHappenedError);
  //     return null;
  //   }
  // }
  //
  //
  // static Future<dynamic> callPatchApi(
  //     {String? url,
  //       dynamic body,
  //       Map<String, dynamic>? parameters,
  //       Map<String, dynamic>? myHeaders,
  //       dynamic modelName}) async {
  //   try {
  //     var dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if (connectivityResult != ConnectivityResult.none) {
  //       Response _response = await dio.patch(url!,
  //           options: Options(headers: myHeaders),
  //           data: body,
  //           queryParameters: parameters);
  //       switch (_response.statusCode) {
  //         case 200:
  //           dynamic modelobj =
  //           await Models.getModelObject(modelName, _response.data);
  //           if (modelobj.code == 1) {
  //             return modelobj;
  //           } else {
  //             Toasts.getErrorToast(text: modelobj.message);
  //           }
  //           return null;
  //
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.noInternetError);
  //       return null;
  //     }
  //   } on DioError catch (ex) {
  //     if (ex.response != null) {
  //       switch (ex.response!.statusCode) {
  //         case 400:
  //           Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //           return null;
  //         case 401:
  //           if(ex.response?.data == ""){
  //             dynamic modelobj;
  //             await RefreshToken().onRefreshTokenApi().
  //             then((value) async{
  //               if(value) {
  //                 Map<String, dynamic> header = {
  //                   "Content-Type": "application/json",
  //                   'Authorization': PreferenceUtils.getToken()
  //                 };
  //                 modelobj = await callPatchApi(
  //                     parameters: parameters,
  //                     modelName: modelName,
  //                     url: url,
  //                     body: body,
  //                     myHeaders: header
  //                 );
  //                 return modelobj;
  //               }
  //             });
  //             return modelobj;
  //           }
  //           else{
  //             Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //             return null;
  //           }
  //         case 500:
  //           Toasts.getErrorToast(text: "Internal Server Error");
  //           return null;
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.badHappenedError);
  //     }
  //   } on Exception {
  //     Toasts.getErrorToast(text: Strings.badHappenedError);
  //     return null;
  //   }
  // }


  // static Future<String> callRefreshTokenApi() async {
  //   try {
  //     var dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if (connectivityResult != ConnectivityResult.none) {
  //       String email =  PreferenceUtils.getEmail();
  //       String password =  PreferenceUtils.getPassword();
  //       String deviceId =  PreferenceUtils.getDeviceId();
  //       Map<String, dynamic> header = {"Content-Type": "application/json"};
  //       Map<String, dynamic> body = {
  //         "email": email,
  //         "password": password,
  //         "deviceId": deviceId
  //       };
  //       Response _response = await dio.post(loginApiUrl,
  //           options: Options(headers: header),
  //           data: body,
  //           );
  //       switch (_response.statusCode) {
  //         case 200:
  //           dynamic modelobj = await Models.getModelObject(Models.loginModel, _response.data);
  //           if (modelobj.code == 1) {
  //             return modelobj.data.token;
  //           } else {
  //             Toasts.getErrorToast(text: modelobj.message);
  //           }
  //           return "";
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return "";
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.noInternetError);
  //       return "";
  //     }
  //   } on DioError catch (ex) {
  //     if (ex.response != null) {
  //       switch (ex.response!.statusCode) {
  //         case 400:
  //           Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //           return "";
  //         case 401:
  //           if(ex.response?.data == null){
  //             return Toasts.getErrorToast(text: "Unauthorized");
  //           }
  //           return Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //         case 500:
  //           Toasts.getErrorToast(text: "Internal Server Error");
  //           return "";
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return "";
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.badHappenedError);
  //     }
  //   } on Exception {
  //     Toasts.getErrorToast(text: Strings.badHappenedError);
  //     return "";
  //   }
  // }

  // static Future<dynamic> callLoginApi(
  //     {String? url,
  //       dynamic body,
  //       required BuildContext context,
  //       Map<String, dynamic>? parameters,
  //       Map<String, dynamic>? myHeaders,
  //       dynamic modelName}) async {
  //   try {
  //     var dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if (connectivityResult != ConnectivityResult.none) {
  //       Response _response = await dio.post(url!,
  //           options: Options(headers: myHeaders),
  //           data: body,
  //           queryParameters: parameters);
  //       switch (_response.statusCode) {
  //         case 200:
  //           dynamic modelobj = await Models.getModelObject(modelName, _response.data);
  //           if (modelobj.code == 1) {
  //             return modelobj;
  //           } else {
  //             Toasts.getErrorToast(text: modelobj.message);
  //           }
  //           return null;
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.noInternetError);
  //       return null;
  //     }
  //   } on DioError catch (ex) {
  //     if (ex.response != null) {
  //       switch (ex.response!.statusCode) {
  //         case 400:
  //           if(ex.response?.data["code"] == 2){
  //             return Toasts.showCustomDialog(
  //                 context: context,
  //                 onPress: (){
  //                   Navigator.pop(context);
  //                 },
  //             );
  //
  //           }
  //           else{
  //             Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //             return null;
  //           }
  //         case 401:
  //             Toasts.getErrorToast(text: ex.response?.data["data"]["message"]);
  //             return null;
  //
  //         case 500:
  //           Toasts.getErrorToast(text: "Internal Server Error");
  //           return null;
  //         default:
  //           Toasts.getErrorToast(text: Strings.badHappenedError);
  //           return null;
  //       }
  //     } else {
  //       Toasts.getErrorToast(text: Strings.badHappenedError);
  //     }
  //   } on Exception {
  //     Toasts.getErrorToast(text: Strings.badHappenedError);
  //     return null;
  //   }
  // }

}
