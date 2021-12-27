import '/data/model/post/post.dart';
import 'package:get/get.dart';

class HomeApi extends GetConnect {
  Future<List<Post>> posts() async {
    final response = await get("https://jsonplaceholder.typicode.com/posts");

    if (response.status.hasError) {
      return Future.error("${response.statusText}");
    }

    return (response.body as List<dynamic>)
        .map((e) => Post.fromJson(e))
        .toList();
  }
}
