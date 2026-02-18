import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final searchTextContoller = TextEditingController().obs;
  final searchTextFocusNode = FocusNode().obs;

  @override
  void onClose() {
    searchTextContoller.value.dispose();
    super.onClose();
  }
}