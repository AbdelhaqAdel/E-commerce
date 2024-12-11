class HomeModel {
  bool? status;
  dynamic message;
  Data? data;

  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );


}

class Data {
  List<Banner>? banners;
  List<Product>? products;


  Data({
    this.banners,
    this.products,

  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),

  );


}

class Banner {
  int? id;
  String? image;

  Banner({
    this.id,
    this.image,
  });
  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    image: json["image"],

  );

}


class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.inFavorites,
    this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"]?.toDouble(),
    oldPrice: json["old_price"]?.toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

}




// class HomeModel{
//   bool? status;
//   DataModel? data;
//   HomeModel.fromJson(Map<String,dynamic>json){
//     status=json['status'];
//     data=DataModel.fromJson(json['data']);
//   }
// }
// class DataModel{
//   List<BannerModel>banners=[];
//   List<ProductModel>products=[];
//   DataModel.fromJson(Map<String,dynamic>json){
//     json['banners'].forEach((element) {
//       banners.add(element);
//     });
//     json['products'].forEach((element) {
//       products.add(element);
//     });
//   }
// }
// class BannerModel{
//   int? id;
//   String? image;
//   BannerModel.fromJson(Map<String,dynamic>json){
//     id=json['id'];
//     image=json['image'];
//   }
// }
// class ProductModel{
//  late int id;
//  late dynamic price;
//  late dynamic oldPrice;
//  late dynamic discount;
//  late String image;
//  late String name;
//  late bool inFavorite;
//  late bool inCart;
//   ProductModel.fromJson(Map<String,dynamic>json){
//     id=json['id'];
//     image=json['image'];
//     oldPrice=json['old_price'];
//     price=json['price'];
//     discount=json['discount'];
//     name=json['name'];
//     inFavorite=json['in_favorites'];
//     inCart=json['in_cart'];
//   }
// }