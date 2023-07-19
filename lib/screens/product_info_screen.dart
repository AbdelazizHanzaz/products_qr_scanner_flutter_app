
import 'package:flutter/material.dart';

class ProductInfoScreen extends StatefulWidget {

  final String productCodebar;
  const ProductInfoScreen({super.key, required this.productCodebar});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Information"),
      ),
      body: Center( child: Text("Product code bar is : ${widget.productCodebar}"),),
    );
  }
}