import 'package:salla/shared/services/private/constants.dart';
import 'package:salla/shared/utils/widgets/navigation.dart';
import 'package:salla/view/auth_view/shop_login.dart';

void logOut(context){
  AppConstants.kToken=null;
  NavigationAndFinish(context, const ShopLogin());
}
