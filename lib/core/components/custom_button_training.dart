import 'package:flutter/material.dart';
import 'package:training/core/core.dart';

class CustomButtonTraining extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Widget? prefixIcon;
  final Color? backgroundColor;

  const CustomButtonTraining({
    super.key,
    required this.onPressed,
    required this.title,
    this.prefixIcon,
    this.backgroundColor = AppColors.blue,
    
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            minimumSize: const Size.fromHeight(55)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            const SpaceWidth(10),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            )
          ],
        ));
  }
}
