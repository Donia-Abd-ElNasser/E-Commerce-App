
import 'package:ecommerce/core/utills/services.dart';
import 'package:ecommerce/screens/home/model/item_model.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.apiServices) : super(HomeInitial());
  final ApiServices apiServices;

Future<void> fetchHomeData() async {
  emit(HomeLoading());
  try {
    final categoriesData = await apiServices.get(endPoint: 'categories');
    final brandsData = await apiServices.get(endPoint: 'brands');
    final productsData = await apiServices.get(endPoint: 'products');

    final categories = (categoriesData['data'] as List)
        .map((e) => ItemModel.fromJson(e)).toList();

    final brands = (brandsData['data'] as List)
        .map((e) => ItemModel.fromJson(e)).toList();

    final products = (productsData['data'] as List)
        .map((e) => ProductModel.fromJson(e)).toList();

    emit(HomeSuccess(
      categories: categories,
      brands: brands,
      products: products,
    ));
  } catch (e) {
    emit(HomeFailure(errMessage: e.toString()));
  }
}

}
