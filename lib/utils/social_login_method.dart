import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialflutter/ui/model/res_google_signin_model.dart';
import 'package:socialflutter/utils/constants/app_constants.dart';
import 'package:socialflutter/utils/constants/key_constants.dart';
import 'package:socialflutter/utils/constants/social_keys.dart';
import 'package:socialflutter/utils/widgets/progress_dialog.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

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
  Fluttertoast.showToast(
      msg: googleUser!.email,
      backgroundColor: Colors.blue,
      textColor: Colors.white);
  LogUtils.showLog("${_socialGoogleUser.toJson()}");
}

//Facebook SignIn Process
void _facebookSignInProcess(BuildContext context) async {
  LoginResult result = await FacebookAuth.instance.login();
  ProgressDialogUtils.showProgressDialog(context);
  if (result.status == LoginStatus.success) {
    AccessToken accessToken = result.accessToken!;
    Map<String, dynamic> userData = await FacebookAuth.i.getUserData(
      fields: KeyConstants.facebookUserDataFields,
    );
    ProgressDialogUtils.dismissProgressDialog();
    Fluttertoast.showToast(
        msg: userData[KeyConstants.emailKey],
        backgroundColor: Colors.blue,
        textColor: Colors.white);
    LogUtils.showLog("${accessToken.userId}");
    LogUtils.showLog("$userData");
  } else {
    ProgressDialogUtils.dismissProgressDialog();
  }
}

//Twitter SignIn Process
void _twitterSignInProcess(BuildContext context) async {
  TwitterLogin twitterLogin = TwitterLogin(
    apiKey: SocialKeys.twitterApiKey,
    apiSecretKey: SocialKeys.twitterApiSecretKey,
    redirectURI: SocialKeys.twitterRedirectUri,
  );
  AuthResult authResult = await twitterLogin.login();
  ProgressDialogUtils.showProgressDialog(context);
  switch (authResult.status) {
    case TwitterLoginStatus.loggedIn:
      ProgressDialogUtils.dismissProgressDialog();
      LogUtils.showLog("${authResult.authToken}");
      Fluttertoast.showToast(
          msg: authResult.user!.email.toString(),
          backgroundColor: Colors.blue,
          textColor: Colors.white);
      break;
    case TwitterLoginStatus.cancelledByUser:
      ProgressDialogUtils.dismissProgressDialog();
      LogUtils.showLog("${authResult.status}");
      Fluttertoast.showToast(
          msg: authResult.status.toString(),
          backgroundColor: Colors.blue,
          textColor: Colors.white);
      break;
    case TwitterLoginStatus.error:
      ProgressDialogUtils.dismissProgressDialog();
      LogUtils.showLog("${authResult.status}");
      Fluttertoast.showToast(
          msg: authResult.status.toString(),
          backgroundColor: Colors.blue,
          textColor: Colors.white);
      break;
    case null:
      ProgressDialogUtils.dismissProgressDialog();
      LogUtils.showLog("${authResult.status}");
      Fluttertoast.showToast(
          msg: authResult.status.toString(),
          backgroundColor: Colors.blue,
          textColor: Colors.white);
      break;
  }
}

//Combine Social Authentication
Future initiateSocialLogin(BuildContext context, String provider) async {
  try {
    if (provider == AppConstants.googleProvider) {
      _googleSignInProcess(context);
    } else if (provider == AppConstants.facebookProvider) {
      _facebookSignInProcess(context);
    } else if (provider == AppConstants.twitterProvider) {
      _twitterSignInProcess(context);
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
