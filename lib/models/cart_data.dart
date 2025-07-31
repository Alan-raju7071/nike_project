// cart_data.dart

class CartItem {
  final String image;
  final String name;
  final String category;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    this.quantity = 1,
  });
}

List<CartItem> cartItems = [];

void addToCart(CartItem item) {
  // If the same item (name + size) exists, just increase quantity
  final existing = cartItems.firstWhere(
    (e) => e.name == item.name && e.image == item.image,
    orElse: () => CartItem(image: '', name: '', category: '', price: 0),
  );

  if (existing.name != '') {
    existing.quantity += item.quantity;
  } else {
    cartItems.add(item);
  }
}

double getCartTotal() {
  return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
}
