
import 'package:flutter/material.dart';

void NavigateTo(context,Widget)=>Navigator.push(
  context,
MaterialPageRoute(
  builder: (context)=>Widget,
),
 );


void NavigationAndFinish(context,Widget)=>Navigator.pushAndRemoveUntil(context,
MaterialPageRoute(
  builder: (context)=>Widget,
),
 (route) => false
 );