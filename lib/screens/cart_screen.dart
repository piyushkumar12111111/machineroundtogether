import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../models/item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController _cartController = Get.find();
    return Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: Obx(
          () => _cartController.cartItems.isEmpty
              ? const Center(child: Text('Your Cart is Empty'))
              : ListView.builder(
                  itemCount: _cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    Item item = _cartController.cartItems[index];
                    return ListTile(
                      title: Text(item.title),
                      // Add more details, maybe image
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _cartController.removeItem(item),
                      ),
                    );
                  },
                ),
        ));
  }
}
