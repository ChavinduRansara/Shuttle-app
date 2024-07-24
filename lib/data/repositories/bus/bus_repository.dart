import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/features/personalization/model/bus_model.dart';
import 'package:shuttle_app/utils/constants/exceptions/firebase_exception.dart';
import 'package:shuttle_app/utils/constants/exceptions/format_exception.dart';
import 'package:shuttle_app/utils/constants/exceptions/platform_exception.dart';

class BusRepository extends GetxController {
  static BusRepository get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveBusDetails(BusModel busModel) async {
    try {
      await _firestore.collection('bus_location').doc(busModel.busId).set(busModel.toJson());
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

  Future<List<BusModel>> fetchBusDetails() async {
    try {
      final querySnapshot = await _firestore.collection('bus_location').get();
      final buses = querySnapshot.docs.map((doc) => BusModel.fromSnapshot(doc)).toList();
      return buses;
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

  Future<void> updateBusDetails(BusModel updateBus) async {
    try {
      await _firestore.collection('bus_location').doc(updateBus.busId).update(updateBus.toJson());
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

  // Future<void> updateSingleField(Map<String, dynamic> json) async {
  //   try {
  //     await _firestore.collection('bus_location').doc(AuthenticationRepository.instance.currentUser?.uid).update(json);
  //   } on FirebaseException catch (e) {
  //     throw AppFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const AppFormatException();
  //   } on PlatformException catch (e) {
  //     throw AppPlatformException(e.code).message;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> removeBusRecord(String busId) async {
    try {
      await _firestore.collection('bus_location').doc(busId).delete();
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