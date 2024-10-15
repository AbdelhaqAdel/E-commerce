part of 'Shop_cubit.dart';

abstract class ShopState {}
class NavBarState extends ShopState {}
class HomeInitialState extends ShopState {}
class UserHomeLoadingState extends ShopState {}
class UserHomeSuccessState extends ShopState {
  final HomeModel homeData;
  UserHomeSuccessState(this.homeData);
}
class UserHomeErrorState extends ShopState {
  final String error;
  UserHomeErrorState(this.error);
}
class UserFavSuccessState extends ShopState {}
class UserCategoryLoadingState extends ShopState {}
class UserCategorySuccessState extends ShopState {
  final CategoriesModel categories;
  UserCategorySuccessState(this.categories);
}
class UserCategoryErrorState extends ShopState {
  final String error;
  UserCategoryErrorState(this.error);
}
class UserGetFavLoadingState extends ShopState {}
class UserGetFavSuccessState extends ShopState {
  final GetFavoritesModel favorites;
  UserGetFavSuccessState(this.favorites);
}
class UserGetFavErrorState extends ShopState {
  final String error;
  UserGetFavErrorState(this.error);
}

class UserLoadingState extends ShopState {}
class UserSuccessState extends ShopState {
  final UserProfileModel userData;
  UserSuccessState(this.userData);
}
class UserErrorState extends ShopState {
  final String error;
  UserErrorState(this.error);
}
class UpdateLoadingState extends ShopState {}
class UpdateSuccessState extends ShopState {
  final UpdateUserModel updateModel;
  UpdateSuccessState(this.updateModel);
}
class UpdateErrorState extends ShopState {
  final String error;
  UpdateErrorState(this.error);
}

// abstract class ShopState {}

// class shopHomeInitialState extends ShopState {}

// class NavBar_state extends ShopState {}

// class shopHomeLoadingState extends ShopState {}

// class shopHomeSuccessState extends ShopState {

//   shopHomeSuccessState();

// }
// class shopHomeErrorState extends ShopState {
//   String? error;
//   shopHomeErrorState(this.error);
// }
// /*----------------------*/
// class shopCategoryLoadingState extends ShopState {}

// class shopCategorySuccessState extends ShopState {

//   shopCategorySuccessState();

// }
// class shopCategoryErrorState extends ShopState {

//   shopCategoryErrorState();
// }


// class shopFavSuccessState extends ShopState {

//   shopFavSuccessState();

// }
// class shopFavErrorState extends ShopState {

//   shopFavErrorState();
// }
// class shopGetFavLoadingState extends ShopState {
//   shopGetFavLoadingState();
// }
// class shopGetFavSuccessState extends ShopState {
//   shopGetFavSuccessState();
// }
// class shopGetFavErrorState extends ShopState {

//   shopGetFavErrorState();
// }

// class shopGetUserLoadingState extends ShopState {
//   shopGetUserLoadingState();
// }
// class shopGetUserLSuccessState extends ShopState {
//   shopGetUserLSuccessState();
// }
// class shopGetUserErrorState extends ShopState {

//   shopGetUserErrorState();
// }


// class update_loading_state extends ShopState{}
// class update_success_state extends ShopState{}
// class update_error_state extends ShopState{
//   String? error;
//   update_error_state(this.error);
// }
