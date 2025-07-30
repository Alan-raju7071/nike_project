import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  final List<Map<String, dynamic>> favourites = [
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHy98jE-3YS5_NMZBSA5L57kKJa0ox4mrDQw&s',
      'title': 'Nike SB Dunk Low Pro',
      'price': '23,795.00',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLQGwdkO8L4fQqS9rvIYlXgnlEczfQoXIE7Q&s',
      'title': 'Nike Alphafly 3 Premium',
      'price': '23,795.00',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWqZgxcZbv4Q3eAvsMvtweBmyUweYGNserZw&s',
      'title': 'Nike Air Pastel Light',
      'price': '23,795.00',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQIt0W_sTXtiftYPVfCIBc2Gvr_BtrU-WIuw&s',
      'title': 'Nike Zoom Fly 5',
      'price': '23,795.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Favourites',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: favourites.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final item = favourites[index];
                    return Container(
  margin: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // This is the key fix
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Image Container with Heart icon
      Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: NetworkImage(item['image']),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.favorite, color: Colors.orange),
          ),
        ],
      ),

      // Text content
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Bestseller',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              item['title'],
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'MRP : ₹ ${item['price']}',
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    ],
  ),
)
;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
