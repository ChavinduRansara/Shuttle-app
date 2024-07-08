
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/features/personalization/model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserDetails(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar('FirebaseException', e.message!);
      rethrow;
    } on FormatException catch (e) {
      Get.snackbar('FormatException', e.message);
      rethrow;
    } on PlatformException catch (e) {
      Get.snackbar('PlatformWxception', e.message!);
      rethrow;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }
}