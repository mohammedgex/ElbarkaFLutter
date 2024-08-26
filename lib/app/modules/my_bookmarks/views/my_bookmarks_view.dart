import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_bookmarks_controller.dart';

class MyBookmarksView extends GetView<MyBookmarksController> {
  const MyBookmarksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBookmarksView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyBookmarksView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
