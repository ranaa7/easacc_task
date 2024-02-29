import 'package:easacc_task/view/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin facebookLogin = FacebookLogin();
  FirebaseAuth auth = FirebaseAuth.instance;

 // String get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //_user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
    await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    await auth.signInWithCredential(credential).then((user) {
     // saveUser(user);
      Get.offAll(SettingPage());
    });
  }

  void facebookSignInMethod() async{
    print("hi");
    FacebookLoginResult result = await facebookLogin.logIn( customPermissions: ['email']);
    final accessToken = result.accessToken?.token;
    print(accessToken);
    if(result.status==FacebookLoginStatus.success){
      final faceCredential = FacebookAuthProvider.credential(accessToken!);
      await auth.signInWithCredential(faceCredential);
    }

  }



}