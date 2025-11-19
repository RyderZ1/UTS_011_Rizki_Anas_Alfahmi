import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima data produk yang dikirim
    final productData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Icon (product.icon)
            Icon(
              productData['icon'] as IconData,
              size: 150, // Ukuran ikon diperbesar
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 30),
            
            // Text (product.name)
            Text(
              productData['name'] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            
            // Text (product.price) - HARGA DITAMPILKAN KEMBALI DI HALAMAN DETAIL
            Text(
              productData['price'] as String,
              style: const TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 50),
            
            // Tombol Aksi
            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_cart_outlined),
              label: const Text("Tambahkan ke Keranjang", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${productData['name']} ditambahkan ke keranjang!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}