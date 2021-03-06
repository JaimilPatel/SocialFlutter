import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialflutter/ui/social_signin.dart';

import 'utils/localization/localization.dart';

void main() {
  runApp(SocialAuthApp());
}

class SocialAuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        statusBarBrightness: Brightness.light));
    return MaterialApp(
      title: 'Social Authentication',
      debugShowCheckedModeBanner: false,
      home: SocialSignInScreen(),
      localizationsDelegates: [
        const MyLocalizationsDelegate(),
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
      ],
    );
  }
}
