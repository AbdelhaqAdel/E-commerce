import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/home/data/categories_model.dart';
import '../../model/home/data/home_model.dart';
import '../../view_model/home_cubit/Shop_cubit.dart';

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            ShopCubit cubit=ShopCubit.get(context);
            // int?  index=0;
            // Datum? categorisList=cubit.categories?.data?.data?[index];
            // List<Datum>cat_list=cubit.categorisList;
             return Scaffold(
              body: Container(
                child:  ConditionalBuilder(
                    condition: cubit.homeData!=null,
                    builder:(context)=>
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSlider(items:  cubit.homeData?.data?.banners
                              ?.map(
                                (e) => Image(
                              image: NetworkImage('${e.image}'),
                              width: double.infinity,
                              fit: BoxFit.cover,
                      ),
                    ).toList(),
                              options:CarouselOptions(
                                autoPlay: true,
                                reverse: false,
                                viewportFraction: 1,
                                height: 250,
                                autoPlayInterval: Duration(seconds: 2),
                                scrollDirection: Axis.horizontal,
                              )),
                              SizedBox(height: 10,),
                              Container(
                                height: 120,
                                child: ConditionalBuilder(
                                  condition: state is! UserCategoryLoadingState,
                                  builder: (context) => ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => BuildCat(
                                          Datum: cubit.categories?.data?.data![index]),
                                      separatorBuilder: (context, index) => SizedBox(
                                        width: 15,
                                      ),
                                      itemCount:
                                      cubit.categories?.data?.data?.length ?? 0),
                                  fallback: (context) =>
                                      Center(child: CircularProgressIndicator()),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                                child: GridView.count(
                                  clipBehavior: Clip.antiAlias,
                                  shrinkWrap: true,
                                  physics:NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  mainAxisSpacing:1,
                                  crossAxisSpacing:1,
                                  childAspectRatio: 1/1.5,
                                  children:List.generate(
                                  cubit.homeData?.data?.products?.length??0,
                                   (index) =>
                                    BuildProductGrid(cubit.homeData?.data?.products?[index],context))
                                ),
                              ),
                            ],
                          ),
                        ) ,
                    fallback:(context)=> Center(child: CircularProgressIndicator())),
              ),

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
  Widget BuildCat({required Datum? Datum}) => Container(
    width: 120,
    height: 120,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          image: NetworkImage('${Datum?.image}'),
          fit: BoxFit.cover,
          height: 120,
        ),
        Container(
            width: double.infinity,
            color: Colors.black.withOpacity(.5),
            child: Text(
              '${Datum?.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.white,
              ),
            )),
      ],
    ),
  );

}
/* */