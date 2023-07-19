import 'dart:developer';

import 'package:barcode_app/screens/product_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../data/models/product.dart';
import '../web_service/api_service.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  bool _isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isScanned ? QRView(
        key: qrKey, 
        onQRViewCreated: _onQRViewCreated,
      ): Center(
        child: ElevatedButton.icon(
          onPressed: (){
            setState(() {
               _isScanned = !_isScanned;
            });
          }, 
          icon: const Icon(Icons.qr_code, size: 45), 
          label: const Text("QR View")),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) => _onQrScanned(scanData));
  }

  void _onQrScanned(Barcode scanResult) {
    controller.pauseCamera();
    // Process scan result
    lookupBarcode(scanResult.code!);
    
  }

 lookupBarcode(String barcode){

  // Show loading indicator

  
  try {
    // Lookup product info from API based on barcode   
    //Product product = await APIService.getProductByBarcode(barcode);
    log("Navigate to product info : $barcode");
    
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ProductInfoScreen(productCodebar: barcode)  
      )
    );

  } catch (error) {
    // Handle error
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product not found!'))
    );
       setState(() {
     _isScanned = false;
   });
  }

  // Hide loading indicator
}
}