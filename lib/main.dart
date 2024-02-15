import 'package:flutter/material.dart';
import 'package:machineroundtogether/screens/item_list_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ItemListScreen(),
        ),
      ),
    );
  }
}
