import '../../../auth/data/models/login_model.dart';
import '../../../auth/data/models/update_user_model.dart';
import '../../../categories/data/models/categories_model.dart';
import '../../../cart/data/models/favorites_model.dart';
import '../models/home_model.dart';
import '../../../../api/api_services.dart';
import '../../../../api/end_points.dart';

class HomeRepository {

   Future<HomeModel> getHomeData({required String? token}) async {
    final response = await ApiService.get(url: Endpoint.home, token: token);
    return HomeModel.fromJson(response?.data);
  }

  Future<FavModel?> changeFavorite({required String? token, required int productId}) async {
    final response = await ApiService.post(
      url: Endpoint.favorites,
      data: {'product_id': productId},
      token: token,
    );
    return FavModel.fromJson(response?.data);
  }

  Future<CategoriesModel?> getCategoriesData({required String? token}) async {
    final response = await ApiService.get(url: Endpoint.categories, token: token);
    return CategoriesModel.fromJson(response?.data);
  }

  Future<GetFavoritesModel?> getFavoritesData({required String? token}) async {
    final response = await ApiService.get(url: Endpoint.favorites, token: token);
    return GetFavoritesModel.fromJson(response?.data);
  }
  
  Future<UserProfileModel?> getUserData({required String? token}) async {
    final response = await ApiService.get(url: Endpoint.profile, token: token);
    return UserProfileModel.fromJson(response?.data);
  }

  Future<UpdateUserModel?> updateUser({
    required String? token,
    required String? name,
    required String? email,
    required String? phone,
  }) async {
    final response = await ApiService.put(
      url: Endpoint.update,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    );
    return UpdateUserModel.fromJson(response?.data);
  }
}
