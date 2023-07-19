// product_screen.dart

import 'package:flutter/material.dart';

import '../data/models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadProductDetails();
  }

  _loadProductDetails() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Fetch product details from API
      

    } catch (err) {
      // Handle error

    }
 
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: _isLoading
        //? const Center(child: CircularProgressIndicator())
        ? const Center(child: Text("Product not loaded yet"))
        : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.product.imageUrl),
                
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              
                Text('\$${widget.product.price}'),
              
                Text(widget.product.description),
              
                // Add product details like 
                // category, availability etc
              
                ElevatedButton.icon(
                  onPressed: () {
                    // Add to cart  
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("Add to shopping cart"),
                )
              ],  
            ),
          ),
        ),
    );
  }
}