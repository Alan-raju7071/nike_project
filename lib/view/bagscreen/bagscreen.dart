import 'package:flutter/material.dart';
import 'package:nike_project/controller/cart_controller.dart';
import 'package:provider/provider.dart';
import 'package:nike_project/models/cart_data.dart';


class Bagscreens extends StatelessWidget {
  const Bagscreens({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bag"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                "Your bag is empty",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                item.image,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.category,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "₹${(item.price * item.quantity).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          cart.decrementQuantity(index);
                                        },
                                        icon: const Icon(Icons.remove),
                                      ),
                                      
                                      Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          cart.incrementQuantity(index);
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                       IconButton(
      onPressed: () {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Remove Item"),
      content: const Text("Are you sure you want to remove this item?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            cart.removeItem(index);
            Navigator.pop(context);
          },
          child: const Text("Remove", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
},

      icon: const Icon(Icons.delete_outline, color: Colors.red),
    ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹${cart.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
