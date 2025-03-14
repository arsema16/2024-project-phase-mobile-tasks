// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

// import 'package:collection/collection.dart';

class Product {
  String name;
  String description;
  double price;

  Product({required this.name, required this.description, required this.price});

  Product copyWith({String? name, String? description, double? price}) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'price': price,
      'name': name,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      description: map['description'] as String,
      price: map['price'] as double,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Product(description: $description, price: $price)';

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.description == description && other.price == price;
  }

  @override
  int get hashCode => description.hashCode ^ price.hashCode;
}

class ProductManager {
  List<Product> products = [];
  ProductManager({required this.products});

  void addProduct() {
    stdout.write('Enter product name: ');
    String name = stdin.readLineSync()!;
    stdout.write('Enter product description: ');
    String description = stdin.readLineSync()!;
    stdout.write('Enter product price: ');
    double price = double.parse(stdin.readLineSync()!);

    products.add(Product(name: name, description: description, price: price));
    ('Product added successfully.');
  }

  void viewProducts() {
    if (products.isEmpty) {
      print('No products available.');
      return;
    }

    for (int i = 0; i < products.length; i++) {
      print('${i + 1}. ${products[i].name} (\$${products[i].price})');
    }
  }

  void viewProductDetails() {
    stdout.write('Enter product number: ');
    int index = int.parse(stdin.readLineSync()!) - 1;

    if (index < 0 || index >= products.length) {
      print('Invalid product number.');
      return;
    }

    Product p = products[index];
    print(
      'Name: ${p.name}\nDescription: ${p.description}\nPrice: \$${p.price}',
    );
  }

  void editProduct() {
    stdout.write('Enter product number to edit: ');
    int index = int.parse(stdin.readLineSync()!) - 1;

    if (index < 0 || index >= products.length) {
      print('Invalid product number.');
      return;
    }

    stdout.write('Enter new name: ');
    products[index].name = stdin.readLineSync()!;
    stdout.write('Enter new description: ');
    products[index].description = stdin.readLineSync()!;
    stdout.write('Enter new price: ');
    products[index].price = double.parse(stdin.readLineSync()!);

    print('Product updated successfully.');
  }

  void deleteProduct() {
    stdout.write('Enter product number to delete: ');
    int index = int.parse(stdin.readLineSync()!) - 1;

    if (index < 0 || index >= products.length) {
      print('Invalid product number.');
      return;
    }

    products.removeAt(index);
    print('Product deleted successfully.');
  }

  ProductManager copyWith({List<Product>? products}) {
    return ProductManager(products: products ?? this.products);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductManager.fromMap(Map<String, dynamic> map) {
    return ProductManager(
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductManager.fromJson(String source) =>
      ProductManager.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductManager(products: $products)';

  //   @override
  //   bool operator ==(covariant ProductManager other) {
  //     if (identical(this, other)) return true;
  //     final listEquals = const DeepCollectionEquality().equals;

  //     return
  //       listEquals(other.products, products);
  //   }

  //   @override
  //   int get hashCode => products.hashCode;
}

void main() {
  List<Product> productList = [
    Product(name: 'Coffee', description: 'Good for health', price: 300.0),
    Product(name: 'Tea', description: 'Refreshing drink', price: 150.0),
  ];
  ProductManager manager = ProductManager(products: productList);

  while (true) {
    print(
      '\n1. Add Product\n2. View Products\n3. View Product Details\n4. Edit Product\n5. Delete Product\n6. Exit',
    );
    stdout.write('Choose an option: ');
    String choice = stdin.readLineSync() ?? "-1";
    // ignore: unnecessary_null_comparison
    if (choice == null || choice.isEmpty) {
      print("No input provided! Please enter a valid choice.");
    } else {
      print("You entered: $choice");
    }

    switch (choice) {
      case '1':
        manager.addProduct();
        break;
      case '2':
        manager.viewProducts();
        break;
      case '3':
        manager.viewProductDetails();
        break;
      case '4':
        manager.editProduct();
        break;
      case '5':
        manager.deleteProduct();
        break;
      case '6':
        print('Goodbye!');
        return;
      default:
        print('Invalid choice. Try again.');
    }
  }
}
