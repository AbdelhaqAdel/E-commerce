import 'package:flutter/material.dart';
import '../../../cart/data/models/favorites_model.dart';
import '../manager/home_cubit.dart';

class ProductItem extends StatelessWidget {
  final Product? product;
  final BuildContext context;

  const ProductItem({ this.product, required this.context, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  child: Image.network(
                    '${product?.image}',
                    fit: BoxFit.fill,
                  ),
                ),
                if (product?.discount != 0)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: const Text(
                      'Discount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 30,
              child: Text(
                '${product?.name}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  '${product?.price}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                if (product?.discount != 0)
                  Text(
                    '${product?.oldPrice}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: ShopCubit.get(context).favorites[product?.id] == true
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  child: IconButton(
                    onPressed: () {
                      ShopCubit.get(context).changeFavorite(productId: product!.id!);
                    },
                    icon: const Icon(Icons.favorite_border),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
