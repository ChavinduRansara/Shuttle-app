import 'package:flutter/material.dart';

class CustomHeaderDiscription extends StatelessWidget {
  const CustomHeaderDiscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 80,left: 20,right: 20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'User',
                // controller.getLastName(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CircleAvatar(
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


