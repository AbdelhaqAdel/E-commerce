import 'package:salla/model/home/data/categories_model.dart';
import 'package:salla/model/home/data/favorites_model.dart';
import 'package:salla/model/auth/auth_data/login_model.dart';
import 'package:salla/model/home/home_repo/repo.dart';
import 'package:salla/model/home/data/home_model.dart';
import 'package:salla/shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/auth/auth_data/update_user_model.dart';
import '../../view/home_view/CategoriesScreen/CategoriesScreen.dart';
import '../../view/home_view/FavoritesScreen/FavoritesScreen.dart';
import '../../view/home_view/SettingsScreen/SettingsScreen.dart';
import '../../view/home_view/ShopHomeScreen.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this._userRepository) : super(HomeInitialState());
    final HomeRepository _userRepository;
  static ShopCubit get(context)=> BlocProvider.of(context);


  List<Widget> navBar = [const ShopHomeScreen(), const Categories(), const Favorite(), const SettingsScreen()];
  int NavBar_index = 0;
  void NavBar_M({required index}) {
    NavBar_index = index;
    emit(NavBarState());
  }
UserProfileModel? userData;
void getUserData({required String? token}) async {
    emit(UserLoadingState());
    try {
       userData = await _userRepository.getUserData(token: token);
      emit(UserSuccessState(userData!));
    } catch (error) {
      emit(UserErrorState(error.toString()));
    }
  }

  // Update User Data
  void updateUser({
    required String? token,
    required String? name,
    required String? email,
    required String? phone,
  }) async {
    emit(UpdateLoadingState());
    try {
      final updateModel = await _userRepository.updateUser(
        token: token,
        name: name,
        email: email,
        phone: phone,
      );
      emit(UpdateSuccessState(updateModel!));

      // Optionally, refresh user data after updating
      getUserData(token: token);
    } catch (error) {
      emit(UpdateErrorState(error.toString()));
    }
  }

  Map<int, bool> favorites = {};

  HomeModel? homeData;
  void getHomeData({required String? token}) async {
    emit(UserHomeLoadingState());
    try {
      homeData = await _userRepository.getHomeData(token: token);
      homeData?.data?.products?.forEach((element) {
        favorites[element.id!] = element.inFavorites!;
      });
      emit(UserHomeSuccessState(homeData!));
    } catch (error) {
      emit(UserHomeErrorState(error.toString()));
    }
  }

  // Change Favorite Status
  void changeFavorite({required int productId}) async {
    favorites[productId] = !favorites[productId]!;  // Toggle favorite status
    emit(UserFavSuccessState());

    try {
      final favModel = await _userRepository.changeFavorite(token: token, productId: productId);
      if (!favModel!.status!) {
        favorites[productId] = !favorites[productId]!;  // Revert if there's an error
      } else {
        getFavoritesData(token: token);  // Refresh favorites if successful
      }
      emit(UserFavSuccessState());
    } catch (error) {
      favorites[productId] = !favorites[productId]!;  // Revert on error
      emit(UserFavSuccessState());
    }
  }

  CategoriesModel ? categories;
  void getCategoriesData({required String? token}) async {
    emit(UserCategoryLoadingState());
    try {
       categories = await _userRepository.getCategoriesData(token: token);
      emit(UserCategorySuccessState(categories!));
    } catch (error) {
      emit(UserCategoryErrorState(error.toString()));
    }
  }

  GetFavoritesModel ? favoritesModel;
  void getFavoritesData({required String? token}) async {
    emit(UserGetFavLoadingState());
    try {
      favoritesModel = await _userRepository.getFavoritesData(token: token);
      emit(UserGetFavSuccessState(favoritesModel!));
    } catch (error) {
      emit(UserGetFavErrorState(error.toString()));
    }
  }
}
