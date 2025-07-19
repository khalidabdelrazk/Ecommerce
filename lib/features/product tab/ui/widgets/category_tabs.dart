import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTabs extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryTabs({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 137.w,
      decoration: BoxDecoration(
        color: const Color(0xffEDF1F5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          bottomLeft: Radius.circular(8.r),
        ),
        border: Border(
          left: BorderSide(color: Colors.grey[300]!, width: 2.w),
          top: BorderSide(color: Colors.grey[300]!, width: 2.w),
          bottom: BorderSide(color: Colors.grey[300]!, width: 2.w),
        ),
      ),

      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;
          return GestureDetector(
            onTap: () => onCategorySelected(category),
            child: Container(
              color: isSelected ? Colors.white : Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                children: [
                  if (isSelected)
                    Container(width: 5, height: 65, color: AppColors.primaryColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      category ?? " ",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
