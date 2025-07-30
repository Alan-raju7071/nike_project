import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  final List<Map<String, String>> highlights = const [
    {
      'title': "New Arrivals",
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHy98jE-3YS5_NMZBSA5L57kKJa0ox4mrDQw&s'
    },
    {
      'title': "Just Dropped: Alphafly 3",
      'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmlrZSUyMHNob2V8ZW58MHx8MHx8fDA%3D'
    },
    {
      'title': "Nike Pegasus premium",
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLQGwdkO8L4fQqS9rvIYlXgnlEczfQoXIE7Q&s'
    },
    {
      'title': "Air Force 1",
      'image': 'https://thumbs.dreamstime.com/b/colorful-sport-shoes-purple-color-backround-modern-fashion-colorful-sport-shoes-purple-color-backround-modern-fashion-368274882.jpg'
    },
    {
      'title': "Tennis",
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxxiIno0RiwJ8Q-pd4dr7w1I_QEzR1iDGYNw&s'
    },
    {
      'title': "Shop All",
      'image': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/20547d52-3e1b-4c3d-b917-f0d7e0eb8bdf/custom-nike-air-force-1-low-by-you-shoes.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/Group 489.png',
                  height: 30,
                ),
                const Icon(Icons.search, size: 28),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Shop",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _shopTab("Men", isActive: true),
                _shopTab("Women"),
                _shopTab("Kids"),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "This Week’s Highlights",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),

            // 🔄 GridView.builder for highlights
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(), // To let ListView handle scrolling
              shrinkWrap: true,
              itemCount: highlights.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) {
                final item = highlights[index];
                return _highlightCard(item['title']!, item['image']!);
              },
            ),

            const SizedBox(height: 24),
            _gridCard("New & Featured", 'https://thumbs.dreamstime.com/b/colorful-sport-shoes-purple-color-backround-modern-fashion-colorful-sport-shoes-purple-color-backround-modern-fashion-368274882.jpg'),
            const SizedBox(height: 12),
            _gridCard("Shoes", 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmlrZSUyMHNob2V8ZW58MHx8MHx8fDA%3D'),
          ],
        ),
      ),
    );
  }

  Widget _shopTab(String title, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.black : Colors.grey[600],
        ),
      ),
    );
  }

  Widget _highlightCard(String title, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _gridCard(String title, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
