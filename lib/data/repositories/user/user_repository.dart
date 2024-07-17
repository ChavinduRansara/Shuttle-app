
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/features/personalization/model/user_model.dart';
import 'package:shuttle_app/utils/constants/exceptions/firebase_exception.dart';
import 'package:shuttle_app/utils/constants/exceptions/format_exception.dart';
import 'package:shuttle_app/utils/constants/exceptions/platform_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserDetails(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      rethrow;
    }
  }
}