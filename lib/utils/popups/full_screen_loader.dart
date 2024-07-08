import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/animation_loader.dart';
import 'package:shuttle_app/utils/helpers/helper_functions.dart';

class FullScreenLoader{
  static void openLoadingDialog(String text, String animation){
    showDialog(
      context: Get.overlayContext!, 
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AppHelperFunctions.isDarkMode(Get.context!)? Colors.black : Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250,),
              AppAnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        ),
      )
    );
  }

  static closeLoadingDialog(){
    Navigator.of(Get.overlayContext!).pop();
  }
}