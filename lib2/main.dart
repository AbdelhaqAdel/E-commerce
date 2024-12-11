import 'core/services/cache_services.dart';
import 'core/di/service_locator.dart';
import 'core/constants/app_constants.dart';
import 'features/layout/layout_body.dart';
import 'features/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'features/layout/layout_screen.dart';
import 'api/api_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    ApiService.init();
    setupServiceLocator(); 
    await CacheHelper.init();
    AppConstants.kToken = CacheHelper.getData(key: 'token');
      if (AppConstants.kToken == null) {
       AppConstants.kStartWidget=OnBoarding();
    }
  else{
    AppConstants.kStartWidget=const Layout();
  }
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) { 
  return  ScreenUtilInit(
                designSize: const Size(428, 926),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppConstants.kStartWidget,
    );});
  }
}
