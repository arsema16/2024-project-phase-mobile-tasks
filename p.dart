import 'dart:io';

class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class ProductData {
  static final List<Product> _products = [];

  static List<Product> getAllProducts() => _products;

  static Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  static void createProduct(Product product) => _products.add(product);

  static void updateProduct(Product updatedProduct) {
    int index = _products.indexWhere((product) => product.id == updatedProduct.id);
    if (index != -1) _products[index] = updatedProduct;
  }

  static void deleteProduct(String id) {
    _products.removeWhere((product) => product.id == id);
  }
}

class ViewAllProductsUsecase implements UseCase<List<Product>, void> {
  @override
  Future<List<Product>> call(void params) async {
    return ProductData.getAllProducts();
  }
}

class ViewProductUsecase implements UseCase<Product?, String> {
  @override
  Future<Product?> call(String id) async {
    return ProductData.getProductById(id);
  }
}

class CreateProductUsecase implements UseCase<void, Product> {
  @override
  Future<void> call(Product product) async {
    ProductData.createProduct(product);
  }
}

class UpdateProductUsecase implements UseCase<void, Product> {
  @override
  Future<void> call(Product product) async {
    ProductData.updateProduct(product);
  }
}

class DeleteProductUsecase implements UseCase<void, String> {
  @override
  Future<void> call(String id) async {
    ProductData.deleteProduct(id);
  }
}

void main() async {
  final viewAllProductsUsecase = ViewAllProductsUsecase();
  final viewProductUsecase = ViewProductUsecase();
  final createProductUsecase = CreateProductUsecase();
  final updateProductUsecase = UpdateProductUsecase();
  final deleteProductUsecase = DeleteProductUsecase();

  while (true) {
    print('--- Product Management System ---');
    print('1. View All Products');
    print('2. View Product by ID');
    print('3. Add New Product');
    print('4. Update Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Select an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // View All Products
        List<Product> products = await viewAllProductsUsecase.call(null);
        if (products.isEmpty) {
          print('No products available.');
        } else {
          print('All Products:');
          products.forEach((product) {
            print('ID: ${product.id}, Name: ${product.name}, Price: ${product.price} \ birr');
          });
        }
        break;

      case '2':
        // View Product by ID
        stdout.write('Enter Product ID to view: ');
        String? productId = stdin.readLineSync();
        if (productId != null) {
          Product? product = await viewProductUsecase.call(productId);
          if (product != null) {
            print('Product Details:');
            print('ID: ${product.id}, Name: ${product.name}');
            print('Description: ${product.description}');
            print('Price: ${product.price} \ birr');
          } else {
            print('Product not found.');
          }
        }
        break;

      case '3':
        // Add New Product
        stdout.write('Enter Product ID: ');
        String? id = stdin.readLineSync();
        stdout.write('Enter Product Name: ');
        String? name = stdin.readLineSync();
        stdout.write('Enter Product Description: ');
        String? description = stdin.readLineSync();
        stdout.write('Enter Product Image URL: ');
        String? imageUrl = stdin.readLineSync();
        stdout.write('Enter Product Price: ');
        String? priceInput = stdin.readLineSync();
        
        if (id != null && name != null && description != null && imageUrl != null && priceInput != null) {
          double price = double.tryParse(priceInput) ?? 0;
          Product newProduct = Product(
            id: id,
            name: name,
            description: description,
            imageUrl: imageUrl,
            price: price,
          );
          await createProductUsecase.call(newProduct);
          print('Product added successfully!');
        }
        break;

      case '4':
        // Update Product
        stdout.write('Enter Product ID to update: ');
        String? updateId = stdin.readLineSync();
        Product? existingProduct = await viewProductUsecase.call(updateId!);
        if (existingProduct != null) {
          stdout.write('Enter New Name (current: ${existingProduct.name}): ');
          String? newName = stdin.readLineSync();
          stdout.write('Enter New Description (current: ${existingProduct.description}): ');
          String? newDescription = stdin.readLineSync();
          stdout.write('Enter New Image URL (current: ${existingProduct.imageUrl}): ');
          String? newImageUrl = stdin.readLineSync();
          stdout.write('Enter New Price (current: ${existingProduct.price} \ birr): ');
          String? newPriceInput = stdin.readLineSync();

          double newPrice = double.tryParse(newPriceInput!) ?? existingProduct.price;
          Product updatedProduct = Product(
            id: existingProduct.id,
            name: newName ?? existingProduct.name,
            description: newDescription ?? existingProduct.description,
            imageUrl: newImageUrl ?? existingProduct.imageUrl,
            price: newPrice,
          );

          await updateProductUsecase.call(updatedProduct);
          print('Product updated successfully!');
        } else {
          print('Product not found.');
        }
        break;

      case '5':
        // Delete Product
        stdout.write('Enter Product ID to delete: ');
        String? deleteId = stdin.readLineSync();
        if (deleteId != null) {
          await deleteProductUsecase.call(deleteId);
          print('Product deleted successfully!');
        }
        break;

      case '6':
        // Exit
        print('Exiting...');
        return;

      default:
        print('Invalid choice. Please try again.');
    }

    print('--------------------------------');
  }
}
