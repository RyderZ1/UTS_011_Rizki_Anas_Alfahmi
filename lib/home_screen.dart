import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Data dummy lengkap dengan 8 produk spesifik di setiap kategori.
  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Makanan', 
      'icon': Icons.fastfood,
      'products': [
        {'name': 'Mie Instan', 'price': 'Rp 3.500', 'icon': Icons.ramen_dining},
        {'name': 'Roti Tawar', 'price': 'Rp 15.000', 'icon': Icons.bakery_dining},
        {'name': 'Biskuit Regal', 'price': 'Rp 8.000', 'icon': Icons.cookie},
        {'name': 'Keripik Kentang', 'price': 'Rp 18.000', 'icon': Icons.bakery_dining},
        {'name': 'Sereal Sarapan', 'price': 'Rp 32.000', 'icon': Icons.breakfast_dining},
        {'name': 'Cokelat Batangan', 'price': 'Rp 10.000', 'icon': Icons.cake},
        {'name': 'Permen Karet', 'price': 'Rp 5.000', 'icon': Icons.colorize}, 
        {'name': 'Nasi Instan', 'price': 'Rp 8.000', 'icon': Icons.rice_bowl},
      ]
    },
    {
      'name': 'Minuman', 
      'icon': Icons.local_cafe,
      'products': [
        {'name': 'Aqua (600ml)', 'price': 'Rp 4.000', 'icon': Icons.water_drop},
        {'name': 'Pocari Sweat', 'price': 'Rp 10.000', 'icon': Icons.sports_bar},
        {'name': 'Teh Pucuk', 'price': 'Rp 6.500', 'icon': Icons.local_drink},
        {'name': 'Kopi Instan', 'price': 'Rp 25.000', 'icon': Icons.coffee},
        {'name': 'Susu UHT Cokelat', 'price': 'Rp 12.000', 'icon': Icons.local_drink_sharp},
        {'name': 'Jus Kemasan Apel', 'price': 'Rp 18.000', 'icon': Icons.emoji_food_beverage}, 
        {'name': 'Minuman Soda', 'price': 'Rp 7.000', 'icon': Icons.local_bar},
        {'name': 'Air Kelapa', 'price': 'Rp 15.000', 'icon': Icons.flare},
      ]
    },
    {
      'name': 'Elektronik', 
      'icon': Icons.devices_other,
      'products': [
        {'name': 'Handphone X', 'price': 'Rp 8.500.000', 'icon': Icons.smartphone},
        {'name': 'Laptop Asus', 'price': 'Rp 12.000.000', 'icon': Icons.laptop},
        {'name': 'Earphone Bluetooth', 'price': 'Rp 250.000', 'icon': Icons.headset},
        {'name': 'Mouse Wireless', 'price': 'Rp 150.000', 'icon': Icons.mouse},
        {'name': 'Smart TV 50"', 'price': 'Rp 6.000.000', 'icon': Icons.tv},
        {'name': 'Power Bank 10k', 'price': 'Rp 200.000', 'icon': Icons.battery_charging_full}, 
        {'name': 'Speaker Bluetooth', 'price': 'Rp 450.000', 'icon': Icons.speaker},
        {'name': 'Keyboard Mekanik', 'price': 'Rp 700.000', 'icon': Icons.keyboard},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop Mini"),
        toolbarHeight: 70, 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Styling Judul
            const Text(
              "Kategori Produk",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF1E3A8A)),
            ),
            const SizedBox(height: 30),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: categories.map((category) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 8, // Efek bayangan
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), 
                      ),
                      child: InkWell( // Feedback visual saat diklik
                        onTap: () {
                          // NAVIGATE TO ProductListScreen dengan data kategori
                          Navigator.pushNamed(
                            context,
                            '/product-list',
                            arguments: category, 
                          );
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Icon(category['icon'] as IconData, size: 50, color: Theme.of(context).primaryColor),
                              const SizedBox(height: 12),
                              Text(
                                category['name'] as String,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}