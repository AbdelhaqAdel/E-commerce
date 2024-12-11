import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../categories/data/models/categories_model.dart';

class HomeCategoryItem extends StatelessWidget {
  final Datum? datum;

  const HomeCategoryItem({required this.datum, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  width: 100.w,
  height: 100.h,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20), 
    border: Border.all(
      width: 2,
      color: AppColors.blueColor
    )
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          image: NetworkImage('${datum?.image}'),
          fit: BoxFit.cover,
          height: 120,
          width: 120.w,
        ),
      Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3), 
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16), 
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '${datum?.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        
      ],
    ),
  ),
); }
}