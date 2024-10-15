import 'package:flutter/material.dart';
import 'package:salla/shared/utils/widgets/navigation.dart';
import 'package:salla/view/auth_view/shop_login.dart';
void printFullData(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) {
    print(match.group((0)));
  });
}

String? token;
Widget? startWidget;

void logOut(context){
  token=null;
  NavigationAndFinish(context, ShopLogin());

}
