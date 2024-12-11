import '../../core/widgets/background.dart';
import '../home/data/home_repo/home_repo.dart';
import '../../core/di/service_locator.dart';
import '../../core/constants/app_constants.dart';
import '../home/presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/layout_app_bar.dart';
import 'widgets/layout_body.dart';
import 'widgets/layout_bottom_navigation_bar.dart';
class LayoutView extends StatelessWidget {
  const LayoutView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => ShopCubit(getIt.get<HomeRepository>())..getHomeData(token: AppConstants.kToken)..
      getCategoriesData(token: AppConstants.kToken)..getFavoritesData(token: AppConstants.kToken)..
      getUserData(token: AppConstants.kToken),
      child: BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            ShopCubit cubit=ShopCubit.get(context);
            return  BackGround(
            widget: Stack(
              children: [
                Screen(cubit: cubit),
                LayoutAppBar(
                  cubitContext: context,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(child: LayoutNavigationBar()),
                  ],
                ),
              ],
            ),     );
         
          }),
    );

  }
}
