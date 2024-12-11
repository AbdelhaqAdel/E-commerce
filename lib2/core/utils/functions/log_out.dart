import '../../constants/app_constants.dart';
import '../widgets/navigation.dart';
import '../../../features/auth/presentation/screens/login.dart';

void logOut(context){
  AppConstants.kToken=null;
  NavigationAndFinish(context, const LoginScreen());
}
