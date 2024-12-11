import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/styles/app_colors.dart';
import '../../home/presentation/manager/home_cubit.dart';


class LayoutNavigationBar extends StatelessWidget {
  const LayoutNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12.0,
        right: 12,
        left: 12,
      ),
      child:  Container(
        width:  MediaQuery.of(context).size.width < 450
            ?  MediaQuery.of(context).size.width:  450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 10)
              // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          selectedFontSize: 17,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          selectedIconTheme:
          const IconThemeData(color: AppColors.lightBackgroundColor, size: 27),
          unselectedIconTheme:
          const IconThemeData(
              color: Colors.grey, size: 25),
          unselectedLabelStyle: const TextStyle(
            color: AppColors.lightBackgroundColor,
          ),
          unselectedFontSize: 15,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          currentIndex: ShopCubit.get(context).NavBar_index,

          onTap: (index) {
              ShopCubit.get(context).NavBar_M(index: index);
          },
          items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category'),
                  BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Profile'),
                ],
        ),
      ),
    );
  },
);
  }
}