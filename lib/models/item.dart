class Item {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  bool isInCart;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isInCart = false,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }

  Item copyWith({
    int? id,
    String? title,
    String? description,
    String? imageUrl,
    bool? isInCart,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isInCart: isInCart ?? this.isInCart,
    );
  }
}
