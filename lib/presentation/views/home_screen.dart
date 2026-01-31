import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/presentation/widgets/main_widgets/app_bar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            color: AppSolidColors.darkPrimaryText
          ),
        ),
      ),
    );
  }
}

