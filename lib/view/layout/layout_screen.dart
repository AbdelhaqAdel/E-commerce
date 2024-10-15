import 'package:salla/model/home/home_repo/repo.dart';
import 'package:salla/shared/services/service_locator.dart';
import 'package:salla/shared/services/private/constants.dart';
import 'package:salla/view_model/home_cubit/Shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            return Scaffold(

              appBar: AppBar(
                title: Text('salla'),
                actions: [
                  IconButton(onPressed: (){

                }, icon: Icon(Icons.search))],
              ),
              bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: Colors.blue,
                selectedItemColor: Colors.grey[600],
                currentIndex:cubit.NavBar_index ,
                onTap: (index){
                  cubit.NavBar_M(index: index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category'),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
                ],
              ),
              body: cubit.navBar[cubit.NavBar_index],
            );
          }),
    );

  }
}
