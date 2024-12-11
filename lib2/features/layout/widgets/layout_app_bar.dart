import 'package:flutter/material.dart';

class LayoutAppBar extends StatelessWidget {
  const LayoutAppBar({
    super.key, required this.cubitContext,
  });
  final BuildContext cubitContext;


  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // DrawerIcon(),
            Text("Waged",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Spacer(),
       
          
           ],
        ),
      ),
    );
  }
}

// class DrawerIcon extends StatelessWidget {
//   const DrawerIcon({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => layoutScaffoldKey.currentState?.openDrawer(),
//       behavior: HitTestBehavior.translucent,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 0.0, left: 20),
//         child: SizedBox(

//           width: 38,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 2.8,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 7),
//               Container(

//                 width: 20,
//                 height: 2.5,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.black,
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }