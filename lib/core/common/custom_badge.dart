import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_assets.dart';
import '../utils/app_colors.dart';
import '../routing/app_routes.dart';

class CustomAppBarBadge extends StatelessWidget {
  final int count;

  const CustomAppBarBadge({required this.count, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return InkWell(
      onTap:
          currentRoute != AppRoutes.cartRoute
              ? () {
                Navigator.of(context).pushNamed(AppRoutes.cartRoute);
              }
              : null,
      child: Badge(
        alignment: AlignmentDirectional.topStart,
        backgroundColor: AppColors.greenColor,
        label: Text(count.toString()),
        child: ImageIcon(
          AssetImage(AppAssets.shoppingCart),
          size: 35.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
