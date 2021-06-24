import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialflutter/ui/model/res_google_signin_model.dart';
import 'package:socialflutter/utils/constants/app_constants.dart';

import 'log_utils.dart';

//Google SignIn Process
void _googleSignInProcess(BuildContext context) async {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  String? token = googleAuth?.idToken;
  ResGoogleSignInModel _socialGoogleUser = ResGoogleSignInModel(
      displayName: googleUser?.displayName,
      email: googleUser?.email,
      photoUrl: googleUser?.photoUrl,
      id: googleUser?.id,
      token: token);
  LogUtils.showLog("${_socialGoogleUser.toJson()}");
}

//Combine Social Authentication
Future initiateSocialLogin(BuildContext context, String provider) async {
  try {
    if (provider == AppConstants.googleProvider) {
      _googleSignInProcess(context);
    }
  } on Exception catch (e) {
    LogUtils.showLog("$e");
  }
}

//Combine Social Logout
Future initiateSocialLogout(BuildContext context, String provider) async {
  try {
    GoogleSignIn().signOut();
  } on Exception catch (e) {
    LogUtils.showLog("$e");
  }
}
