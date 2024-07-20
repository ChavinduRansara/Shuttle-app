import 'package:flutter/material.dart';

class AppSectionHeading extends StatelessWidget{
  const AppSectionHeading({
    super.key, 
    this.textColor, 
    this.showActionButton = true, 
    required this.title, 
    this.buttonTitlel = 'View All', 
    this.onPressed});
  

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitlel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitlel))
      ],
    );
  }

 
  
}