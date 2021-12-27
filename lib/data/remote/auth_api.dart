import 'package:get/get.dart';

class AuthApi extends GetConnect {
  Future<dynamic> login() async {
    final response = await get("https://jsonplaceholder.typicode.com/posts");

    if (response.status.hasError) {
      return Future.error("${response.statusText}");
    }
    return Future.value(response.bodyString);
  }
}
