
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shuttle_app/features/authentication/screens/login/login.dart';
import 'package:shuttle_app/features/authentication/screens/onbording.dart';
import 'package:shuttle_app/features/authentication/screens/signUp/verify_email.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Redirects user to the appropriate screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else{
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen()); 
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('FirebaseAuthException', e.message!);
      rethrow;
    } on FirebaseException catch (e) {
      Get.snackbar('FirebaseException', e.message!);
      rethrow;
    } on FormatException catch (e) {
      Get.snackbar('FormatException', e.message);
      rethrow;
    } on PlatformException catch (e) {
      Get.snackbar('PlatformException', e.message!);
      rethrow;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }

  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('FirebaseAuthException', e.message!);
      rethrow;
    } on FirebaseException catch (e) {
      Get.snackbar('FirebaseException', e.message!);
      rethrow;
    } on FormatException catch (e) {
      Get.snackbar('FormatException', e.message);
      rethrow;
    } on PlatformException catch (e) {
      Get.snackbar('PlatformException', e.message!);
      rethrow;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('FirebaseAuthException', e.message!);
      rethrow;
    } on FirebaseException catch (e) {
      Get.snackbar('FirebaseException', e.message!);
      rethrow;
    } on FormatException catch (e) {
      Get.snackbar('FormatException', e.message);
      rethrow;
    } on PlatformException catch (e) {
      Get.snackbar('PlatformException', e.message!);
      rethrow;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }

}