import 'package:flutter/material.dart';
import 'package:socialflutter/ui/social_signin.dart';

import 'utils/localization/localization.dart';

void main() {
  runApp(SocialAuthApp());
}

class SocialAuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
