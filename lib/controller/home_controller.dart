import 'package:get/get.dart';

import '../data/model/post/post.dart';
import '../data/remote/home_api.dart';

class HomeController extends GetxController with StateMixin<List<Post>> {
  final HomeApi _api = HomeApi();

  @override
  void onInit() {
    super.onInit();
    _posts();
  }

  Future<void> _posts() => _api.posts().then(
        (response) => change(response, status: RxStatus.success()),
        onError: (err) => change(null, status: RxStatus.error(err)),
      );

  Future<void> refreshPosts() => _posts();
}
