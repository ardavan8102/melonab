import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melonab/app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(
    const MyApp()
  );
}