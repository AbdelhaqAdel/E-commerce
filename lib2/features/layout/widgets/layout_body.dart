
import 'package:flutter/material.dart';
import '../../home/presentation/manager/home_cubit.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.cubit,
  });

  final ShopCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: cubit.navBar[cubit.NavBar_index],
    );
  }
}
