// Home Screen

import 'package:barcode_app/web_service/api_service.dart';
import 'package:flutter/material.dart';

import '../data/models/category.dart';
import '../data/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> _categories = [];
  List<Product> _featuredProducts = [];
  List<Product> _recentProducts = [];

  @override
  void initState() {
    super.initState();
    getCategories();
    getFeaturedProducts(); 
    getRecentProducts();
  }

  getCategories() async {
    _categories = await APIService.getCategories();
  }

  getFeaturedProducts() async {
    _featuredProducts = await APIService.getFeaturedProducts();
  }

  getRecentProducts() async {
    _recentProducts = await APIService.getRecentProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      
      body: ListView(
        children: [
          // Categories
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(_categories[index]);
              }
            ),
          ),

          // Featured Products
          SizedBox(
            height: 300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: _featuredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(_featuredProducts[index]);  
              },
            ),
          ),
          
          // Recent Products
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: _recentProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(_recentProducts[index]);
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ], 
        currentIndex: 0,
      ),
    );
  }
}

// Category Item
class CategoryItem extends StatelessWidget {
  final Category category;
  
  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(category.imageUrl),
          Text(category.name),
        ],
      ),
    );
  }
}

// Product Card
class ProductCard extends StatelessWidget {
  final Product product;
  
  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(product.imageUrl),
        Text(product.name),
        Text("Price ${product.price}"),
      ],  
    );
  }
}