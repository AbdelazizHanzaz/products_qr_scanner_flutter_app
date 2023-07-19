# Flutter Barcode Scanner App

## Overview

This is a Flutter app that allows scanning barcodes and looking up product information. 

## Features

- Barcode scanning screen using camera
- Lookup product info from API based on barcode
- Product details page
- Models for Product and Category
- API Service using Dio
- Loading indicators

## Code Structure

- `lib/screens` - Contains barcode ScanScreen and ProductScreen
- `lib/services` - APIService for API calls
- `lib/models` - Product and Category models
- `lib/main.dart` - Main app entrypoint

## Packages Used

- qr_code_scanner: ^2.0.0 - For barcode scanning
- dio: ^4.0.0 - For API calls
- json_annotation: ^4.0.0 - For JSON serialization

## Running the App

- Clone the repo
- Run `flutter pub get` to install dependencies 
- Connect API endpoint 
- Run on emulator or device with `flutter run`

## Next Steps

Some ideas for enhancing the app:

- Product search 
- Shopping cart  
- User accounts
- Payment integration
- Light/dark theme

