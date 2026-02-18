import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:melonab/core/theme/main_theme.dart';
import 'package:melonab/presentation/view/splash.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await JustAudioBackground.init(
        androidNotificationChannelId: 'com.melonab.app',
        androidNotificationChannelName: 'Audio playback',
        androidNotificationOngoing: true,
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melonab',
      themeMode: ThemeMode.dark,
      theme: MainTheme.darkTheme,
      locale: const Locale('fa', 'IR'),
      supportedLocales: const [
        Locale('fa', 'IR'),
      ],
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}