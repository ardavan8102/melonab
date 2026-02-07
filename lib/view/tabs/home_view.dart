import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/view_model/home_view_model.dart';
import 'package:melonab/widgets/main_widgets/app_bar.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {

  final homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    //TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        homeViewModel.searchTextFocusNode.value.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(homeViewModel: homeViewModel),
      ),
    );
  }
}