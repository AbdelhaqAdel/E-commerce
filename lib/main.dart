import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:salla/shared/services/api_keys.dart';
import 'package:salla/shared/services/cache_services.dart';
import 'package:salla/shared/services/service_locator.dart';
import 'package:salla/shared/utils/constants.dart';
import 'package:salla/view/On_boarding/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:salla/view/layout/layout_screen.dart';
import 'shared/services/api_services.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    Stripe.publishableKey = ApiKeys.publishableKey;
    ApiService.init();
    setupServiceLocator(); 
    await CacheHelper.init();
    token = CacheHelper.getData(key: 'token');
      if (token == null) {
       startWidget=OnBoarding();
    }
  else{
    startWidget=const LayoutView();
  }
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) { 
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}