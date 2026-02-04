import 'package:flutter/material.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/presentation/views/home_tabs/general_tab.dart';
import 'package:melonab/presentation/widgets/main_widgets/app_bar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: AppDimens.paddingLarge),
        child: Column(
          children: [

            AppDimens.marginLarge.height,

            // contents
            Expanded(
              child: HomeContent(),
            ),
          ],
        ),
      ),
    );
  }
}