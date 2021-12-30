import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/controller/auth_controller.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

import '/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIcons.sign_out),
            onPressed: () => _authController.setUserLoggedInStatus(false),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshPosts();
          return;
        },
        child: controller.obx(
          (state) => ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text("${state?[index].title}"),
              subtitle: Text("${state?[index].body}"),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state?.length ?? 0,
          ),
          onEmpty: const Text('Empty'),
          onError: (err) => Text("$err"),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
