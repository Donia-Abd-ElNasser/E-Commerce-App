class ShippingState {
  final String name;
  final String address;
  final String city;
  final String state;
  
  final String phone;

  ShippingState({
    required this.name,
    required this.address,
    required this.city,
    required this.state,
  
    required this.phone,
  });

  ShippingState copyWith({
    String? name,
    String? address,
    String? city,
    String? state,
    String? zip,
    String? phone,
  }) {
    return ShippingState(
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
     
      phone: phone ?? this.phone,
    );
  }
}