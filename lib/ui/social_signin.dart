import 'package:flutter/material.dart';
import 'package:socialflutter/utils/color_utils.dart';
import 'package:socialflutter/utils/constants/app_constants.dart';
import 'package:socialflutter/utils/constants/file_constants.dart';
import 'package:socialflutter/utils/constants/size_constants.dart';
import 'package:socialflutter/utils/localization/localization.dart';
import 'package:socialflutter/utils/widgets/social_button.dart';

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
        appBar: AppBar(
          title: Text(Localization.of(context)!.appBarLabel),
          centerTitle: true,
          backgroundColor: ColorUtils.purpleColor,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                onPressed: () {
                  initiateSocialLogin(context, AppConstants.googleProvider);
                },
                providerName: FileConstants.icGoogle,
                buttonColor: ColorUtils.whiteColor,
                buttonText: Localization.of(context)!.googleSignInLabel,
                buttonTextColor: ColorUtils.purpleColor,
                height: SizeConstants.socialButtonSize,
              ),
              SocialButton(
                onPressed: () {
                  initiateSocialLogin(context, AppConstants.facebookProvider);
                },
                providerName: FileConstants.icFacebook,
                buttonColor: ColorUtils.purpleColor,
                buttonText: Localization.of(context)!.facebookSignInLabel,
                buttonTextColor: ColorUtils.whiteColor,
                height: SizeConstants.socialButtonSize,
              ),
              SocialButton(
                onPressed: () {
                  initiateSocialLogin(context, AppConstants.twitterProvider);
                },
                providerName: FileConstants.icTwitter,
                buttonColor: ColorUtils.whiteColor,
                buttonText: Localization.of(context)!.twitterSignInLabel,
                buttonTextColor: ColorUtils.purpleColor,
                height: SizeConstants.socialButtonSize,
              ),
            ],
          ),
        ));
  }
}
