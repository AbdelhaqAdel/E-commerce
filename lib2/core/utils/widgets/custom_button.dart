
import 'package:flutter/material.dart';

Widget defaultButton({
  double width=double.infinity,
  bool isUPpercase=true,
  Color background= Colors.blue,
  double radius=3,
  required String text,
  required Function function,
})=>
 Container(
              width: width,
              height: 40,
              color:Colors.blue,
              child: MaterialButton(
                onPressed:(){
                function();
              },
              child: Text(
                isUPpercase?text.toUpperCase():text,
               style: TextStyle(
                color:Colors.white,
               ),
              ),
              ),
   );

 Widget defaultTextButton({
  required Function() function,
  required String text,
 })=>TextButton(
  onPressed: function,

  child: Text(text.toLowerCase()),
);

