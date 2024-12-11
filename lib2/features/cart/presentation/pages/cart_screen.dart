import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/favorites_model.dart';
import '../../../home/presentation/manager/home_cubit.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) => {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              // NavigateTo(context, const MyCartView());
            },
            child: const Text('Pay'),
            ),
          body:
             SingleChildScrollView(
               child: ConditionalBuilder(
                 condition: state is !UserGetFavLoadingState,

                 builder:(context)=> GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  crossAxisCount: 2,
                  mainAxisSpacing:1,
                  crossAxisSpacing:1,
                  childAspectRatio: 1/1.5,
                  children: List.generate(
                    cubit.favoritesModel?.data?.data?.length??0,
                        (index) =>
                            BuildProductGrid(cubit.favoritesModel?.data?.data?[index].product,context),
                  ), // List.generate
            ),
                 fallback:(context)=> const Center(child:CircularProgressIndicator() ,),
               ),
             ),

        );
      },
    );
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
}
