import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  // Fungsi helper untuk menentukan jumlah kolom berdasarkan lebar layar (Responsive Design)
  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth < 600) {
      return 2; // Ponsel
    } else if (screenWidth < 1000) {
      return 3; // Tablet
    } else {
      return 4; // Desktop (4 kolom untuk kerapian)
    }
  }

  @override
  Widget build(BuildContext context) {
    // Menerima data
    final categoryData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final selectedCategory = categoryData['name'] as String;
    final products = categoryData['products'] as List<Map<String, dynamic>>;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory), 
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Text(
              "Daftar Produk di Kategori: $selectedCategory",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          
          Expanded( 
            // LayoutBuilder untuk responsivitas
            child: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = _getCrossAxisCount(constraints.maxWidth);

                return GridView.builder(
                  padding: const EdgeInsets.all(20.0), 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount, 
                    crossAxisSpacing: 20.0, 
                    mainAxisSpacing: 20.0, 
                    childAspectRatio: 0.8, // Sedikit lebih tinggi dari kotak
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    
                    return Card(
                      elevation: 5, // Bayangan yang bagus
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell( // Feedback visual saat diklik
                        onTap: () {
                          // NAVIGATE TO Product DetailScreen
                          Navigator.pushNamed(
                            context,
                            '/product-detail',
                            arguments: product, 
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Icon
                              Icon(product['icon'] as IconData, size: 55, color: Theme.of(context).colorScheme.secondary),
                              
                              // Nama Produk
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                                child: Text(
                                  product['name'] as String,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              
                              // HARGA DIHILANGKAN SESUAI PERMINTAAN
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}