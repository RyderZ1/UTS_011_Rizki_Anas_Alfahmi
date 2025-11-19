import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'product_list_screen.dart';
import 'product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      theme: ThemeData(
        // Tema: Menggunakan warna utama (biru tua/navy)
        primaryColor: const Color(0xFF1E3A8A), 
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo, // Skema warna Indigo
        ).copyWith(
          secondary: Colors.amber, // Warna aksen
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC), // Latar belakang terang
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
          elevation: 0, // AppBar tanpa bayangan
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      // MENGHILANGKAN LABEL DEBUG
      debugShowCheckedModeBanner: false, 
      
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(), 
        '/product-list': (context) => const ProductListScreen(),
        '/product-detail': (context) => const ProductDetailScreen(),
      },
    );
  }
}