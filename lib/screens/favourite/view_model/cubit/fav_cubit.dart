import 'dart:convert';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial()) {
    loadFavourites();
  }

  List<ProductModel> favouriteProducts = [];

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final favData = prefs.getStringList('favourites') ?? [];

    favouriteProducts = favData.map((item) {
      return ProductModel.fromJson(jsonDecode(item));
    }).toList();

    emit(FavSuccess(List.from(favouriteProducts)));
  }

  Future<void> toggleFavourite(ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();

    final index = favouriteProducts.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      favouriteProducts.removeAt(index);
    } else {
      favouriteProducts.add(product);
    }

    final favData = favouriteProducts.map((p) => jsonEncode(p.toJson())).toList();
    await prefs.setStringList('favourites', favData);

    emit(FavSuccess(List.from(favouriteProducts)));
  }

  bool isFavourite(String id) {
    return favouriteProducts.any((p) => p.id == id);
  }
}
