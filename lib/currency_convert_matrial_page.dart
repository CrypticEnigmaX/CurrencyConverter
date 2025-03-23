import 'package:flutter/material.dart';

class CurrencyConvertMaterialPage extends StatefulWidget {
  const CurrencyConvertMaterialPage({super.key});
  @override
  State<CurrencyConvertMaterialPage> createState() =>
      _CurrencyConvertMaterialPageState();
}

class _CurrencyConvertMaterialPageState
    extends State<CurrencyConvertMaterialPage> {
  double result = 0;
  TextEditingController editingController = TextEditingController();
  void conversion() {
    setState(() {
      String inputtext = editingController.text.trim();
      if (inputtext.isNotEmpty) {
        try {
          double inputvalue = double.parse(inputtext);
          result = inputvalue * 81;
        } catch (e) {
          result = 0;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please enter a valid number'),
              backgroundColor: Colors.deepPurpleAccent,
            ),
          );
        }
      } else {
        result = 0;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a valid number'),
            backgroundColor: Colors.deepPurpleAccent,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.deepPurpleAccent,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(40),
    );

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Currency Converter'),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: editingController,
                  style: TextStyle(color: Colors.deepPurpleAccent),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),

                  decoration: InputDecoration(
                    hintText: ('Enter the amount in USD'),
                    prefixIcon: Icon(Icons.attach_money_sharp),
                    prefixIconColor: Colors.deepPurpleAccent,
                    hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                    fillColor: Colors.black87,
                    filled: true,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: conversion,

                  style: ElevatedButton.styleFrom(
                    elevation: 100,
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: Center(
                    child: const Text(
                      'Convert',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
