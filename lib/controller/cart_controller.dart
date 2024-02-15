import 'package:get/get.dart';
import '../models/item.dart';

class CartController extends GetxController {
  final RxList<Item> cartItems = <Item>[].obs;

  void addItem(Item item) {
    int index = cartItems.indexWhere((element) => element.id == item.id);

    if (index != -1) {
      return;
    }

    cartItems.add(item.copyWith(isInCart: true));
  }

  void removeItem(Item item) {
    cartItems.removeWhere((element) => element.id == item.id);
  }
}
