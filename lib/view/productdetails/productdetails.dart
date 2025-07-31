import 'package:flutter/material.dart';
import 'package:nike_project/controller/cart_controller.dart';
import 'package:nike_project/models/cart_data.dart';
import 'package:nike_project/view/bagscreen/bagscreen.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String image;
  final String name;
  final String category;
  final String price;
  const ProductDetailsScreen({super.key,
  required this.image,
    required this.name,
    required this.category,
    required this.price,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSizeIndex = 0;
  int selectedImageIndex = 0;

  final List<int> sizes = [6, 7, 8, 9, 10, 11];

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      widget.image,
      widget.image,
      widget.image,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          widget.name,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.shopping_cart_outlined, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.share_outlined, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Carousel
              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() => selectedImageIndex = index);
                      },
                      itemBuilder: (context, index) => Image.network(
                        images[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: selectedImageIndex == index
                                  ? Colors.black
                                  : Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.category,
                    style: const TextStyle(fontSize: 14)),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("MRP: ${widget.price}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 6),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Inclusive of all taxes\n(also includes all applicable duties)",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),
                const SizedBox(height: 20),

              // Size Selection
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Size – UK", style: TextStyle(fontSize: 14)),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 12,
                children: List.generate(
                  sizes.length,
                  (index) {
                    final isSelected = selectedSizeIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedSizeIndex = index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.grey,
                          ),
                        ),
                        child: Text(
                          sizes[index].toString(),
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 80),
              Row(
            children: [
              // Add to Bag
              Expanded(
                child: InkWell(
                  onTap: () {
  Provider.of<CartProvider>(context, listen: false).addItem(
              CartItem(
                image: widget.image,
                name: widget.name,
                category: widget.category,
                price: double.tryParse(widget.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0,
              ),
            );

  // Add to global cart if needed


  // Navigate to BagScreen with current item(s)
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Bagscreens()
    ),
  );
},

                
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Add to Bag",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Buy Now
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ), // Leave space for bottom bar
            ],
          ),
        ),
      ),

      /// Bottom Buttons
      
      
      
          
    );
  }
}

