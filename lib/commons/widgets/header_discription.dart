
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shuttle_app/features/personalization/controllers/user_controller.dart';

class CustomHeaderDiscription extends StatelessWidget {
  const CustomHeaderDiscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return  Padding(
      padding: const EdgeInsets.only(top: 80,left: 20,right: 20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(
                ()=> Text(
                  controller.user.value.name.split(' ').last,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
      
        ],
      ),
    );
  }
}


