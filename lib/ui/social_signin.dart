import 'package:flutter/material.dart';
import 'package:socialflutter/utils/constants/app_constants.dart';
import 'package:socialflutter/utils/localization/localization.dart';

import '../utils/social_login_method.dart';

///Combine Social Authentication
class SocialSignInScreen extends StatefulWidget {
  @override
  State createState() => SocialSignInScreenState();
}

class SocialSignInScreenState extends State<SocialSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _googleSignInButton(context),
          _facebookSignInButton(context),
          _twitterSignInButton(context)
        ],
      ),
    ));
  }

  // Google SignIn Button
  Widget _googleSignInButton(BuildContext context) => ElevatedButton(
        child: Text(Localization.of(context)!.googleSignInLabel),
        onPressed: () {
          initiateSocialLogin(context, AppConstants.googleProvider);
        },
      );

  //Facebook SignIn Button
  Widget _facebookSignInButton(BuildContext context) => ElevatedButton(
        child: Text(Localization.of(context)!.facebookSignInLabel),
        onPressed: () {
          initiateSocialLogin(context, AppConstants.facebookProvider);
        },
      );

  //Twitter SignIn Button
  Widget _twitterSignInButton(BuildContext context) => ElevatedButton(
        child: Text(Localization.of(context)!.twitterSignInLabel),
        onPressed: () {
          initiateSocialLogin(context, AppConstants.twitterProvider);
        },
      );
}
