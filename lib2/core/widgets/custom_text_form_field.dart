// import 'package:flutter/material.dart';
// import 'package:waged/core/styles/app_colors.dart';
// import 'glass_box.dart';

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     required this.keyboardType,
//     required this.hintText,
//     required this.prefixIcon,
//     required this.obscureText,
//     required this.suffix, 
//     required this.borderRadius,
//     this.cursorColor,
//     this.height,
//     this.withBorder
//     });

//   final TextEditingController controller;
//   final TextInputType keyboardType;
//   final String hintText;
//   final IconData prefixIcon;
//   final bool obscureText;
//   final Widget suffix;
//   final double borderRadius;
//   final Color? cursorColor;
//   final double? height;
//   final bool? withBorder;
//   @override
//   Widget build(BuildContext context) {
//     return GlassBox(widget: SizedBox(
//       height:height?? 70,
//       width: MediaQuery.of(context).size.width<600? MediaQuery.of(context).size.width: 600,
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return '$hintText is Required';
//           }
//           return null;
//         },
//         textAlignVertical: TextAlignVertical.center,
//         cursorColor:cursorColor?? AppColors.buttonColor,
//         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//         decoration: InputDecoration(
//           prefixIcon: Padding(
//             padding: const EdgeInsets.only(left: 20.0, right: 15),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FaIcon(
//                   prefixIcon,
//                   color: KColors.primaryColor,
//                   // size: 30,
//                 ),
//               ],
//             ),
//           ),
//           suffix: suffix,
//           hintText: hintText,
//           hintStyle: Styles.textStyle20,
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.zero,
//           focusedBorder: InputBorder.none,
//           focusedErrorBorder: InputBorder.none,
//           errorStyle: Styles.textStyle12.copyWith(color: Colors.black45),
//           enabledBorder: InputBorder.none,
//           errorBorder: InputBorder.none,
//           disabledBorder: InputBorder.none,
//           // error: Padding(
//           //   padding: const EdgeInsets.only(left: 55.0),
//           //   child: Text('Required'),
//           // ),
//           filled: false,


//         ),
//       ),
//     ),  color: Colors.white.withOpacity(.3),
//       border:withBorder?? true,
//       borderRadius: borderRadius,
//       x: 20,
//       y: 20,);
//   }
// }