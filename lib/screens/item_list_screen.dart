import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machineroundtogether/controller/cart_controller.dart';

import '../models/item.dart';
import '../services/api_service.dart';
import '../widgets/item_card.dart';
import 'cart_screen.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final ApiService _apiService = ApiService();
  List<Item> _items = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _fetchItems();
    Get.put(CartController());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchItems() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<Item> newItems = await _apiService.fetchItems(page: _page);
      setState(() {
        _items.addAll(newItems);
        _page++;
        _isLoading = false;
        _hasMore = newItems.isNotEmpty;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500 &&
        !_isLoading &&
        _hasMore) {
      _fetchItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discovery'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: _items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: _items.length + 1, 
              itemBuilder: (context, index) {
                if (index < _items.length) {
                  return ItemCard(item: _items[index]);
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
    );
  }
}
