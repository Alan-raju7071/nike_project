import 'package:flutter/material.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'title': 'New Arrivals',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHy98jE-3YS5_NMZBSA5L57kKJa0ox4mrDQw&s',
    },
    {
      'title': 'Just Dropped:\nAlphafly 3',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLQGwdkO8L4fQqS9rvIYlXgnlEczfQoXIE7Q&s',
    },
    {
      'title': 'Nike Pegasus\nPremium',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWqZgxcZbv4Q3eAvsMvtweBmyUweYGNserZw&s',
    },
    {
      'title': 'Air Force 1',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6reCUlYEZJugx6iVaIpzmILqrQq-ssGbXBw&s',
    },
    {
      'title': 'Tennis',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw9RiT7FtQ1z5WiPAI3mN5KrVsvGTPeieyBQ&s',
    },
    {
      'title': 'Shop All',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw9RiT7FtQ1z5WiPAI3mN5KrVsvGTPeieyBQ&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.78, // Adjust to reduce height
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    product['image']!,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        product['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
