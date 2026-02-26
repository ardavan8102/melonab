import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:melonab/app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.melonab.app',
    androidNotificationChannelName: 'Melonab Player',
    androidNotificationOngoing: false,
    androidShowNotificationBadge: true,
    androidNotificationIcon: 'mipmap/launcher_icon',
    androidStopForegroundOnPause: true,
  );

  runApp(
    const MyApp()
  );
}