import 'package:salla/model/auth/auth_repo.dart';
import 'package:salla/model/home/home_repo/repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepository>(AuthRepository());
  getIt.registerSingleton<HomeRepository>(HomeRepository());

}

