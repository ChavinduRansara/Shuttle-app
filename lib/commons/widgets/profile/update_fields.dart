import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shuttle_app/commons/widgets/appbar/appbar.dart';
import 'package:shuttle_app/utils/constants/colors.dart';
import 'package:shuttle_app/utils/constants/sizes.dart';

class CutomUpdateDataWidget extends StatelessWidget {
  const CutomUpdateDataWidget({
    super.key,
    required this.controller, 
    required this.pageName, 
    this.pageDescription, 
    required this.formKey, 
    required this.children, 
    required this.onPressed, 
    this.buttonText = 'Update', 
    this.previousValue,
    this.field,
  });

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String pageName;
  final String? pageDescription;
  final Key formKey;
  final List<Widget> children;
  final VoidCallback onPressed;
  final String? buttonText;
  final String? previousValue;
  final String? field;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(pageName),
      ),
      body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pageDescription ?? '',
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),

              previousValue != '' && previousValue != null
                  ? Text('Previous $field : ${previousValue ?? ''}',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    )
                  : const SizedBox.shrink(),

              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),

              Form(
                key: formKey,
                child: Column(
                  children: children,
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSectios,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    side: const BorderSide(color: AppColor.primaryColor),
                  ),
                  onPressed: () {
                    onPressed();
                  },
                  child: Text(
                    buttonText!,
                    style: const TextStyle(
                      fontSize: AppSizes.fontSm,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Obx(() {
                if (controller.loading.value) {
                  return Container(
                    color: Colors.black54,
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColor.primaryColor),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
            ],
          )),
    );
  }
}
