import 'dart:io';
import 'package:melonab/core/consts/urls.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openMyketComment() async {
  if (!Platform.isAndroid) return;

  final myketUri = Uri.parse(
    CustomURLS.myKetCommentIntent,
  );

  final webUri = Uri.parse(
    CustomURLS.myKetAppPageUrl,
  );

  try {
    if (await canLaunchUrl(myketUri)) {
      await launchUrl(
        myketUri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      await launchUrl(
        webUri,
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (e) {
    await launchUrl(webUri, mode: LaunchMode.externalApplication);
  }
}