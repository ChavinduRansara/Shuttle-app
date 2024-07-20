import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/container/card.dart';
import 'package:shuttle_app/commons/widgets/container/custom_search_bar.dart';
import 'package:shuttle_app/commons/widgets/container/primary_header_container.dart';
import 'package:shuttle_app/commons/widgets/container/section_headings.dart';
import 'package:shuttle_app/commons/widgets/header_discription.dart';
import 'package:shuttle_app/data/repositories/authentication/authentication_repository.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';
import 'package:shuttle_app/utils/constants/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeaderDiscription(), 

                  SizedBox(height: AppSizes.spaceBtwSectios/2,),
                  
                  CustomSearchBar(text: 'Search here',), 
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppSectionHeading(title: AppText.pickService, showActionButton: false,),

                  const SizedBox(height: AppSizes.spaceBtwItems,),

                  ShuttleServiceCard(
                    serviceName: 'Galle Road',
                    isAvailable: true,
                    onTap: (){},
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems,),
                  ShuttleServiceCard(
                    serviceName: 'High Level Road',
                    isAvailable: true,
                    onTap: (){},
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems,),
                  ShuttleServiceCard(
                    serviceName: 'Horana',
                    isAvailable: false,
                    onTap: (){},
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems,),
                  ShuttleServiceCard(
                    serviceName: 'Accommodation Shuttle',
                    isAvailable: true,
                    onTap: (){},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

