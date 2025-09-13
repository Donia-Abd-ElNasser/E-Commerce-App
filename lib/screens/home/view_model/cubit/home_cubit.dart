import 'package:ecommerce/core/failure.dart';
import 'package:ecommerce/core/utills/services.dart';
import 'package:ecommerce/screens/home/model/item_model.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.apiServices) : super(HomeInitial());
  final ApiServices apiServices;
 
  Future<void> fetchAllCategories() async {
    emit(HomeCategoriesLoading());
    try {
      final data = await apiServices.get(endPoint: 'categories');
      final List<ItemModel> categories = [];
      for (var i in data['data']) {
        categories.add(ItemModel.fromJson(i));
      }
      print('data success');
      emit(HomeCategoriesSuccess(categories: categories));
    } on Failure catch (e) {
      emit(HomeCategoriesFailure(errMessage: e.errMessage));
      print('-----------------data failure');
    } catch (e) {
      emit(HomeCategoriesFailure(errMessage: e.toString()));
      print('----------------data failure');
    }
  }

  Future<void> fetchAllBrands() async {
    emit(HomeBrandsLoading());
    try {
      final data = await apiServices.get(endPoint: 'brands');
      final List<ItemModel> brands = [];
      for (var i in data['data']) {
        brands.add(ItemModel.fromJson(i));
      }

      emit(HomeBrandsSuccess(brands: brands));
    } on Failure catch (e) {
      emit(HomeBrandsFailure(errMessage: e.errMessage));
    } catch (e) {
      emit(HomeBrandsFailure(errMessage: e.toString()));
    }
  }

  Future<void> fetchAllProducts() async {
    emit(HomeAllProductLoading());
    try {
      final data = await apiServices.get(endPoint: 'products');
      final List<ProductModel> products = [];
      for (var i in data['data']) {
        products.add(ProductModel.fromJson(i));
      }
      emit(HomeProductsSuccess(products: products));
    } on Failure catch (e) {
      emit(HomeAllProductsFailure(errMessage: e.errMessage));
    } catch (e) {
      emit(HomeAllProductsFailure(errMessage: e.toString()));
    }
  }
}
