import 'dart:convert';
import 'package:ecommerce/core/failure.dart';
import 'package:ecommerce/core/shared_preference.dart';
import 'package:ecommerce/core/utills/services.dart';

import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_state.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final ApiServices apiServices;
  CartCubit(this.apiServices) : super(CartInitial());

  List<ProductModel> products = [];
  Map<String, int> quantities = {};

  Future<void> loadSavedQuantities() async {
    final savedData = CacheHelper.getData(key: 'cart_quantities');
    if (savedData != null) {
      quantities = Map<String, int>.from(jsonDecode(savedData));
      print("==> Loaded saved quantities: $quantities");
    }
  }

  Future<void> saveQuantities() async {
    final jsonData = jsonEncode(quantities);
    await CacheHelper.saveData(key: 'cart_quantities', value: jsonData);
    print("==> Saved quantities: $jsonData");
  }

  Future<void> fetchCart() async {
    emit(CartLoading());
    try {
      await loadSavedQuantities();

      final response = await apiServices.get(endPoint: "cart");
      final List<dynamic> items = response["data"]["products"] ?? [];

      products =
          items.map((item) {
            final productJson = item["product"] ?? {};
            productJson["price"] = productJson["price"] ?? item["price"] ?? 0;
            final product = ProductModel.fromJson(productJson);

            quantities[product.id] =
                quantities[product.id] ?? item["count"] ?? 1;

            print(
              "==> Product: ${product.title}, Price: ${product.price}, Qty: ${quantities[product.id]}",
            );
            return product;
          }).toList();

      await saveQuantities();
      emit(CartSuccess(List.from(products)));
    } on Failure catch (e) {
      emit(CartFailure(e.errMessage));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  Future<void> addToCart(String productId) async {
    emit(CartLoading());
    try {
      await apiServices.post(endPoint: "cart", data: {"productId": productId});
      await fetchCart();
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      await apiServices.delete(endPoint: "cart/$productId");
      products.removeWhere((p) => p.id == productId);
      quantities.remove(productId);
      await saveQuantities();
      emit(CartSuccess(List.from(products)));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  void increaseQuantity(String id) {
    quantities[id] = (quantities[id] ?? 1) + 1;
    saveQuantities();
    emit(CartSuccess(List.from(products)));
  }

  void decreaseQuantity(String id) {
    if ((quantities[id] ?? 1) > 1) {
      quantities[id] = (quantities[id] ?? 1) - 1;
      saveQuantities();
      emit(CartSuccess(List.from(products)));
    } else {
      removeFromCart(id);
    }
  }

  double get totalPrice {
    double total = 0;
    for (var product in products) {
      final quantity = quantities[product.id] ?? 1;
      total += (product.price * quantity);
    }
    return total;
  }
}
