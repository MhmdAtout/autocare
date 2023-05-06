import 'package:autocare_app/config/local_storage.config.dart';
import 'package:autocare_app/enums/localTypes.dart';
import 'package:autocare_app/enums/requestMethods.dart';
import 'package:dio/dio.dart';

final options = BaseOptions(
  baseUrl: "http://192.168.0.107:8000",
  contentType: Headers.jsonContentType,
);

final dioClient = Dio(options);

Future sendRequest(
    {required String route,
    RequestMethods method = RequestMethods.GET,
    Map? load}) async {
  final String? token =
      await getLocal(type: LocalTypes.String, key: "access_key");

  if (token != null) {
    final BaseOptions authorizeOptions =
        dioClient.options.copyWith(headers: {"Authorization": "Bearer $token"});

    dioClient.options = authorizeOptions;
  }

  if (method == RequestMethods.GET) {
    final response = await dioClient.get(route, data: load);
    return response;
  } else if (method == RequestMethods.POST) {
    final response = await dioClient.post(route, data: load);
    return response;
  } else if (method == RequestMethods.DELETE) {
    final response = await dioClient.delete(route, data: load);
    return response;
  } else if (method == RequestMethods.PUT) {
    final response = await dioClient.put(route, data: load);
    return response;
  }

  return Future(() {
    return "NULL";
  });
}
