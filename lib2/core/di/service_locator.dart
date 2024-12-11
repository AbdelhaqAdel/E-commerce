import '../../features/home/data/home_repo/home_repo.dart';
import '../../features/auth/data/auth_repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepository>(AuthRepository());
  getIt.registerSingleton<HomeRepository>(HomeRepository());

}

