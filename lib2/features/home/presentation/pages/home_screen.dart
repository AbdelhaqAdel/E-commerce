import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/sized_box.dart';
import '../widgets/category_item.dart';

import '../../../categories/data/models/categories_model.dart';
import '../../data/models/home_model.dart';
import '../manager/home_cubit.dart';

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            ShopCubit cubit=ShopCubit.get(context);
             return Scaffold(
              body: ConditionalBuilder(
                  condition: cubit.homeData!=null,
                  builder:(context)=>
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                     CarouselSlider(
  items: cubit.homeData?.data?.banners
      ?.map(
        (e) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), 
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16), 
            child: Image(
              image: NetworkImage('${e.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
      .toList(),
  options: CarouselOptions(
    autoPlay: true,
    reverse: false,
    viewportFraction: 0.9, 
    height: MediaQuery.of(context).size.height * 0.3,
    autoPlayInterval: const Duration(seconds: 4),
    scrollDirection: Axis.horizontal,
  ),
),

                             verticalSpacer(height: 10,),
                            SizedBox(
                              height: 100,
                              child: ConditionalBuilder(
                                condition: state is! UserCategoryLoadingState,
                                builder: (context) => ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => HomeCategoryItem(
                                        datum: cubit.categories?.data?.data![index]),
                                    separatorBuilder: (context, index) => const SizedBox(
                                      width: 10,
                                    ),
                                    itemCount:
                                    cubit.categories?.data?.data?.length ?? 0),
                                fallback: (context) =>
                                    const Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            verticalSpacer(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: GridView.count(
                                clipBehavior: Clip.antiAlias,
                                shrinkWrap: true,
                                physics:const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                mainAxisSpacing:1,
                                crossAxisSpacing:1,
                                childAspectRatio: 1/1.5,
                                children:List.generate(
                                cubit.homeData?.data?.products?.length??0,
                                 (index) =>
                                  BuildProductGrid(  cubit.homeData?.data?.products?[index],context))
                              ),
                            ),
                          ],
                        ),
                      ) ,
                  fallback:(context)=> Center(child: CircularProgressIndicator())),

            );
          });


  }
  Widget BuildProductGrid(Product? product,context)=>Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    width: 200,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children:[
              Container(
              height: 180,
              width: 180,
              // decoration: BoxDecoration(
               //color: Colors.grey,
              // ),
              child: Image.network('${product?.image}',
              fit: BoxFit.fill,

              ),
            ),
              if(product?.discount!=0)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('Discount',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,

                  ),
                  ),
                ),
            ]
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 30,
            child: Text('${product?.name}',
            overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 5,),
          Container(
            child: Row(
              children: [
                Text('${product?.price}',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(width: 5,),
                Container(
                  child: (product?.discount!=0)?
                  Text('${product?.oldPrice}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                  ),
                  )
                      :SizedBox(),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color:  ShopCubit.get(context).favorites[product?.id] == true ? Colors.blue : Colors.grey,
                  ),
                  child: IconButton(onPressed: (){
                    ShopCubit.get(context).changeFavorite(productId: product!.id!);
                  },
                      icon: Icon(Icons.favorite_border),
                    color:Colors.white,
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget BuildCategoriesItem( Datum model2,  int index) => Container(
    child: Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: 100,
                width: 100,
                 child: Image.network('${model2.image}'),
              ),
              Container(height: 20,
                width: 100,
                child: Center(
                  child: Text('${model2.name}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ],),
  );
  // Widget BuildHomeProduct(HomeModel model)=>Column(
  //   children: [
  //     CarouselSlider(items:model.data?.banners?.map((e) => ) ,
  //         options: CarouselOptions())
  //   ],
  // )
 
}
/* */