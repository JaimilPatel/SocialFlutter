import 'package:socialflutter/utils/constants/key_constants.dart';

class ResGoogleSignInModel {
  String? displayName;
  String? email;
  String? id;
  String? photoUrl;
  String? token;

  ResGoogleSignInModel(
      {this.displayName, this.email, this.id, this.photoUrl, this.token});

  ResGoogleSignInModel.fromJson(Map<String, dynamic> json) {
    displayName = json[KeyConstants.googleDisplayName];
    email = json[KeyConstants.googleEmail];
    id = json[KeyConstants.googleId];
    photoUrl = json[KeyConstants.googlePhotoUrl];
    token = json[KeyConstants.googleToken];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[KeyConstants.googleDisplayName] = this.displayName;
    data[KeyConstants.googleEmail] = this.email;
    data[KeyConstants.googleId] = this.id;
    data[KeyConstants.googlePhotoUrl] = this.photoUrl;
    data[KeyConstants.googleToken] = this.token;
    return data;
  }
}
