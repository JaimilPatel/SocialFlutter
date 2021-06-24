import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialflutter/ui/model/res_google_signin_model.dart';
import 'package:socialflutter/utils/constants/app_constants.dart';
import 'package:socialflutter/utils/constants/key_constants.dart';

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

//Facebook SignIn Process
void _facebookSignInProcess(BuildContext context) async {
  LoginResult result = await FacebookAuth.instance.login();
  if (result.status == LoginStatus.success) {
    AccessToken accessToken = result.accessToken!;
    Map<String, dynamic> userData = await FacebookAuth.i.getUserData(
      fields: KeyConstants.facebookUserDataFields,
    );
    LogUtils.showLog("${accessToken.userId}");
    LogUtils.showLog("$userData");
  }
}

//Combine Social Authentication
Future initiateSocialLogin(BuildContext context, String provider) async {
  try {
    if (provider == AppConstants.googleProvider) {
      _googleSignInProcess(context);
    } else {
      _facebookSignInProcess(context);
    }
  } on Exception catch (e) {
    LogUtils.showLog("$e");
  }
}

//Combine Social Logout
Future initiateSocialLogout(BuildContext context, String provider) async {
  try {
    if (provider == AppConstants.googleProvider) {
      GoogleSignIn().signOut();
    } else {
      await FacebookAuth.instance.logOut();
    }
  } on Exception catch (e) {
    LogUtils.showLog("$e");
  }
}
