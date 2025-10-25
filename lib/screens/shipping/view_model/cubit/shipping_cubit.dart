
import 'package:ecommerce/screens/shipping/view_model/cubit/shipping_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShippingCubit extends Cubit<ShippingState> {
  ShippingCubit()
      : super(ShippingState(
          name: '',
          address: '',
          city: '',
          state: '',
        
          phone: '',
        )) {
    loadShippingData(); 
  }

  
  Future<void> saveShippingData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', state.name);
    await prefs.setString('address', state.address);
    await prefs.setString('city', state.city);
    await prefs.setString('state', state.state);
  
    await prefs.setString('phone', state.phone);
  }


  Future<void> loadShippingData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';
    final address = prefs.getString('address') ?? '';
    final city = prefs.getString('city') ?? '';
    final stateValue = prefs.getString('state') ?? '';
    
    final phone = prefs.getString('phone') ?? '';

    emit(ShippingState(
      name: name,
      address: address,
      city: city,
      state: stateValue,
      
      phone: phone,
    ));
  }


  void updateShipping({
    required String name,
    required String address,
    required String city,
    required String stateValue,
   
    required String phone,
  }) {
    emit(ShippingState(
      name: name,
      address: address,
      city: city,
      state: stateValue,
     
      phone: phone,
    ));
    saveShippingData(); 
  }
}
