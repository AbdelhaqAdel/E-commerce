import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/home/data/categories_model.dart';
import '../../../view_model/home_cubit/Shop_cubit.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) => {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => BuildCatogry(Datum:cubit.categories?.data?.data![index]),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemCount: cubit.categories?.data?.data?.length ?? 0,
              ),
            ),
          ),
        );
      },
    );
  }
  Widget BuildCatogry({required Datum? Datum}) => Container(
    width: double.infinity,
    color: Colors.blueGrey[100],
    child: Row(
      children: [
        Image(
          image: NetworkImage('${Datum?.image}'),
          fit: BoxFit.cover,
          width: 120,
          height: 120,
        ),
        SizedBox(width: 30,),
        Container(
          width: 150,
          child: Text(

            '${Datum?.name}',textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,

              overflow: TextOverflow.ellipsis,

            ),
          ),
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
      ],
    ),
  );

}
