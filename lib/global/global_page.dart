import 'cart_page.dart';

class Globals {
  static List<Cart> addToCart = [];

  static String calculateTotal() {
    double totalPrice = 00;
    for (int i = 0; i < addToCart.length; i++) {
      totalPrice += addToCart[i].quePrice!;
    }
    return totalPrice.toStringAsFixed(2);
  }
}
