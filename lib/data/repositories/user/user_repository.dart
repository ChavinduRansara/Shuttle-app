
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
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

  Future<UserModel> fetchUserDetails() async {
    try {
      final userDoc = await _firestore.collection('users').doc(AuthenticationRepository.instance.currentUser?.uid).get();
      if (userDoc.exists) {
        return UserModel.fromSnapshot(userDoc);
      } else {
        return UserModel.empty();
      }
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

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _firestore.collection('users').doc(updatedUser.uid).update(updatedUser.toJson());
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

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _firestore.collection('users').doc(AuthenticationRepository.instance.currentUser?.uid).update(json);
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

  Future<void> removeUserRecord(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
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