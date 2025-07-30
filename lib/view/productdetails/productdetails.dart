import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSizeIndex = 0;
  int selectedImageIndex = 0;

  final List<int> sizes = [6, 7, 8, 9, 10, 11];
  final List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6reCUlYEZJugx6iVaIpzmILqrQq-ssGbXBw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6reCUlYEZJugx6iVaIpzmILqrQq-ssGbXBw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6reCUlYEZJugx6iVaIpzmILqrQq-ssGbXBw&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Nike SB Dunk Low Pro',
          style: TextStyle(fontSize: 16, color: Colors.black),
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
              // Product Carousel
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

              // Product Info
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nike SB Dunk  Low Pro",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 4),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Skate Shoes", style: TextStyle(fontSize: 14)),
              ),
              const SizedBox(height: 6),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "MRP: ₹ 23,795.00",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
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
              const SizedBox(height: 80), // Leave space for bottom bar
            ],
          ),
        ),
      ),

      /// Bottom Buttons
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // TODO: Add to bag logic
                },
                child: const Text("Add to Bag"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // TODO: Buy now logic
                },
                child: const Text("Buy Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
