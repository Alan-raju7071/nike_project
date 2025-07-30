import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, String>> items = [
  {
    'title': 'New Arrivals',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQIt0W_sTXtiftYPVfCIBc2Gvr_BtrU-WIuw&s',
  },
  {
    'title': 'Just Dropped:\nAlphafly 3',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw9RiT7FtQ1z5WiPAI3mN5KrVsvGTPeieyBQ&s',
  },
  {
    'title': 'Nike Pegasus\npremium',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxxiIno0RiwJ8Q-pd4dr7w1I_QEzR1iDGYNw&s',
  },
  {
    'title': 'Air Force 1',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWqZgxcZbv4Q3eAvsMvtweBmyUweYGNserZw&s',
  },
  {
    'title': 'Tennis',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQIt0W_sTXtiftYPVfCIBc2Gvr_BtrU-WIuw&s',
  },
  {
    'title': 'Shop All',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6reCUlYEZJugx6iVaIpzmILqrQq-ssGbXBw&s',
  },
];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage("https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg"), // Replace with real image
            ),
            const SizedBox(height: 8),
            const Text(
              'John Smith',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Quick Menu Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _ProfileMenuItem(icon: Icons.inventory_2, label: 'Orders'),
                _ProfileMenuItem(icon: Icons.qr_code, label: 'Pass'),
                _ProfileMenuItem(icon: Icons.event, label: 'Events'),
                _ProfileMenuItem(icon: Icons.settings, label: 'Settings'),
              ],
            ),

            const Divider(height: 32),

            // Inbox
            ListTile(
              leading: const Text('Inbox', style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: const Text('View messages'),
              trailing: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Text('2', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              onTap: () {},
            ),

            const Divider(),

            // Member Rewards
            ListTile(
              title: const Text('Your Nike Member Rewards',
                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.deepPurple)),
              subtitle: const Text('2 available'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),

            const Divider(),

            // Following section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Following (19)', style: TextStyle(fontWeight: FontWeight.w600)),
                Text('Edit', style: TextStyle(color: Colors.deepPurple)),
              ],
            ),
            const SizedBox(height: 12),

            GridView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8, // Reduced slightly
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(12),
                    //   child: Align(
                    //     alignment: Alignment.bottomLeft,
                    //     child: Text(
                    //       item['title']!,
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 14,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
            ),


            const SizedBox(height: 24),
          ],
        ),
      ),
      
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ProfileMenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.black87),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
