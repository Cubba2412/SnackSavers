import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _restaurantFamily = 'Restaurant';
  static const String _breadFamily = 'Bread';
  static const String _coffeeFamily = 'Coffee';
  static const String _storeFamily = 'Store';
  static const String _applePayFamily = 'ApplePay';
  static const String _quantityFlaticonFamily = 'QuantityFlaticon';
  static const String _quantityFlaticonFilledFamily = 'QuantityFlaticonFilled';

  // Restaurant
  static const IconData knounRestaurant =
      IconData(0x1f329, fontFamily: _restaurantFamily);

  // Bread
  static const IconData kbread = IconData(0xe900, fontFamily: _breadFamily);

  // Coffee
  static const IconData kcoffee = IconData(0xe900, fontFamily: _coffeeFamily);

  // Store
  static const IconData kstore = IconData(0xe900, fontFamily: _storeFamily);

  // ApplePay
  static const IconData kapplePay =
      IconData(0xe900, fontFamily: _applePayFamily);

  // quantity-flaticon
  static const IconData kquantityFlaticon =
      IconData(0xe900, fontFamily: _quantityFlaticonFamily);

  // quantity-flaticon-filled
  static const IconData kquantityFlaticonFilled =
      IconData(0xe900, fontFamily: _quantityFlaticonFilledFamily);
}
