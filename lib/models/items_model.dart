class ItemModel {
  final String name;
  final String image;
  final double price;
  final bool isAddedToCart;
  int quantity;
  final String description;

  ItemModel({
    required this.isAddedToCart,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
    required this.description,
  });

  ItemModel copyWith({
    int? quantity,
    bool? isAddedToCart,
    String? description,
  }) {
    return ItemModel(
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
      name: name,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
    );
  }
}

final List<ItemModel> fakeItems = [
  ItemModel(
    name: 'Cozy Knit Sweater',
    image: 'assets/images/sweater.png',
    price: 49.99,
    isAddedToCart: false,
    description:
        'A warm and comfortable knit sweater, perfect for chilly days.',
  ),
  ItemModel(
    name: 'Classic Leather Boots',
    image: 'assets/images/boots.png',
    price: 129.99,
    isAddedToCart: false,
    description: 'Durable and stylish leather boots for any occasion.',
  ),
  ItemModel(
    name: 'Minimalist Backpack',
    image: 'assets/images/backpack.png',
    price: 79.99,
    isAddedToCart: false,
    description: 'A sleek, minimalist backpack for everyday use.',
  ),
  ItemModel(
    name: 'Urban Streetwear Jacket',
    image: 'assets/images/jacket.png',
    price: 89.99,
    isAddedToCart: false,
    description: 'Trendy streetwear jacket with a modern fit.',
  ),
  ItemModel(
    name: 'Vintage Denim Jeans',
    image: 'assets/images/jeans.png',
    price: 59.99,
    isAddedToCart: false,
    description: 'Classic vintage denim jeans with a timeless look.',
  ),
  ItemModel(
    name: 'Athletic Running Shoes',
    image: 'assets/images/shoes.png',
    price: 99.99,
    isAddedToCart: false,
    description: 'Lightweight running shoes designed for comfort and speed.',
  ),
];
