import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon, this.title, {super.key, this.onTap, this.color = AppColors.whiteColor, this.activeColor = AppColors.lightRedColor, this.isActive = false, this.isNotified = false});
  final String icon;
  final String title;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      Container(
        alignment: Alignment.center,
        child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // color: isActive ? AppColors.lightRedColor : AppColors.whiteColor,
                ),
                child: Image.asset(icon,),
              ),
              Positioned(
                  bottom: -8,
                  child: Icon(Icons.arrow_drop_up, size: 20.0, color: isActive ? activeColor: Colors.transparent)
              ),
            ]
        ),
      ),
    );
  }
}