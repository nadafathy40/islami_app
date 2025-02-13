import 'package:flutter/material.dart';
import 'package:islami_task/ui/utils/app_colors.dart';

class DotIndicatorWidget extends StatelessWidget {
  final bool isSelected;

  DotIndicatorWidget({super.key,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 8,
        width: isSelected ? 24: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected? AppColors.primary : AppColors.white.withOpacity(0.60),
      ),
    );
  }
}
