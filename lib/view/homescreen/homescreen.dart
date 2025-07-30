import 'package:flutter/material.dart';


class Homescreen extends StatefulWidget {
  
  const Homescreen({super.key});
  

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
   final List<String> bannerImages = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHy98jE-3YS5_NMZBSA5L57kKJa0ox4mrDQw&s',
  'https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmlrZSUyMHNob2V8ZW58MHx8MHx8fDA%3D',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLQGwdkO8L4fQqS9rvIYlXgnlEczfQoXIE7Q&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWqZgxcZbv4Q3eAvsMvtweBmyUweYGNserZw&s',
  'https://static.vecteezy.com/system/resources/previews/049/668/138/non_2x/nike-air-max-exceed-running-shoes-orange-and-blue-comfortable-and-stylish-with-a-transparent-background-png.png',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6reCUlYEZJugx6iVaIpzmILqrQq-ssGbXBw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw9RiT7FtQ1z5WiPAI3mN5KrVsvGTPeieyBQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQIt0W_sTXtiftYPVfCIBc2Gvr_BtrU-WIuw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxxiIno0RiwJ8Q-pd4dr7w1I_QEzR1iDGYNw&s',
  'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/20547d52-3e1b-4c3d-b917-f0d7e0eb8bdf/custom-nike-air-force-1-low-by-you-shoes.png',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset('assets/images/Group 489.png'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning John Smith',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Top Picks for You'),
            const SizedBox(height: 10),
            _buildProductScroll([
  {
    'image': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/edde6171-407b-42fc-b680-858e87462337/custom-nike-blazer-mid-77-shoes-by-you.png',
    'name': 'Air Jordan 1 Low',
    'category': 'Women\'s Shoes',
    'price': '₹ 8,295.00',//
  },
  {
    'image': 'https://c8.alamy.com/comp/W1E73F/vienna-austria-august-25-2017-nike-dunk-low-pro-sb-gold-and-black-sneaker-on-white-background-W1E73F.jpg',
    'name': 'Nike SB Dunk',
    'category': 'Men\'s Shoes',
    'price': '₹ 23,795.00',//
  },
  {
    'image': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/47081799-b7ec-4112-a934-a2eb2cf2c204/custom-nike-air-max-90-shoes-by-you.png',
    'name': 'Nike Air Max',
    'category': 'Running Shoes',
    'price': '₹ 11,999.00',//
  },
  {
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLQGwdkO8L4fQqS9rvIYlXgnlEczfQoXIE7Q&s',
    'name': 'Nike Zoom Freak',
    'category': 'Basketball Shoes',
    'price': '₹ 14,295.00',
  },
  {
    'image': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/20547d52-3e1b-4c3d-b917-f0d7e0eb8bdf/custom-nike-air-force-1-low-by-you-shoes.png',
    'name': 'Nike Air Force 1',
    'category': 'Casual Shoes',
    'price': '₹ 9,995.00',//
  },
  {
    'image': 'https://m.media-amazon.com/images/I/81MS8J-BH4L.jpg',
    'name': 'Nike React Infinity',
    'category': 'Training Shoes',
    'price': '₹ 12,495.00',//
  },
  {
    'image': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/edde6171-407b-42fc-b680-858e87462337/custom-nike-blazer-mid-77-shoes-by-you.png',
    'name': 'Nike Blazer Mid',
    'category': 'High-Top Shoes',
    'price': '₹ 10,999.00',//
  },
  {
    'image': 'https://c8.alamy.com/comp/W1E73F/vienna-austria-august-25-2017-nike-dunk-low-pro-sb-gold-and-black-sneaker-on-white-background-W1E73F.jpg',
    'name': 'Nike Pegasus Trail',
    'category': 'Trail Running',
    'price': '₹ 13,295.00',//
  },
  {
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjFDhQOorpTVrB-yDLq10ccJw1AEx1FhZgsQ&s',
    'name': 'Nike Free RN 5.0',
    'category': 'Barefoot Shoes',
    'price': '₹ 7,495.00',
  },
  {
    'image': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/edde6171-407b-42fc-b680-858e87462337/custom-nike-blazer-mid-77-shoes-by-you.png',
    'name': 'Nike Metcon 8',
    'category': 'Gym Shoes',
    'price': '₹ 10,295.00',//
  },
]),

            const SizedBox(height: 20),
           _buildSectionTitle('New From Nike'),
const SizedBox(height: 10),
SizedBox(
  height: 180,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: bannerImages.length,
    separatorBuilder: (_, __) => const SizedBox(width: 12),
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          bannerImages[index],
          width: MediaQuery.of(context).size.width * 0.8,
          fit: BoxFit.fill,
        ),
      );
    },
  ),
),

            const SizedBox(height: 20),
          ],
        ),
      ),
    
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Text('View All', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildProductScroll(List<Map<String, String>> products) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        product['image']!,
                        height: 120,
                        width: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.favorite_border, color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['name']!,
                          style:
                              const TextStyle(fontWeight: FontWeight.bold)),
                      Text(product['category']!,
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 4),
                      Text('MRP : ${product['price']}'),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
