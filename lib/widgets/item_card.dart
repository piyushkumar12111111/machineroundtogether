import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machineroundtogether/controller/cart_controller.dart';

import '../models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController _cartController = Get.find();
    return InkWell(
      onTap: () {},
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.imageUrl.isNotEmpty)
              Image.network(item.imageUrl,
                  width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(child: Text(item.description)),
                      ElevatedButton(
                        onPressed: () => _cartController.addItem(item),
                        child: Text(
                            item.isInCart ? 'Added to Cart' : 'Add to Cart'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
