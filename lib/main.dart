import 'package:flutter/material.dart';
import 'package:my_currency_converter/currency_convert_matrial_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CurrencyConvertMaterialPage());
  }
}
