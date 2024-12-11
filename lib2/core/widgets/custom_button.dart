import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.onTap, required this.text,
    this.width,
    this.color,
    this.height,
    this.fontSize,
  });


  final Function onTap;
  final String text;
  final double? width;
  final Color?color;
  final double? height;
  final double?fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width ?? (MediaQuery.of(context).size.width<600? MediaQuery.of(context).size.width: 600),
      height: height??70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:color?? AppColors.blueColor,
      ),
      child: TextButton(
        onPressed: (){onTap();},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[300],
            fontWeight: FontWeight.bold,
            fontSize: fontSize?? 25,
          ),
        ),
      ),
    );
  }
}