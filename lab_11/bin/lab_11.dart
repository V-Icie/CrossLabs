import 'dart:async';

class OnlineShop {
  Future<Map<String, dynamic>> getUser() async {
    print('[User] Loading...');

    await Future.delayed(const Duration(seconds: 2));

    print('[User] Loaded successfully');

    return {'id': 20, 'name': 'Oleksandr', 'email': 'showydreamer@gmail.com'};
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    print('[Products] Loading...');

    await Future.delayed(const Duration(seconds: 3));

    print('[Products] Loaded successfully');

    return [
      {'id': 1, 'name': 'Keyboard', 'price': 1500},
      {'id': 2, 'name': 'Mouse', 'price': 800},
      {'id': 3, 'name': 'Headphones', 'price': 2200},
      {'id': 4, 'name': 'Monitor', 'price': 6500},
    ];
  }

  Future<List<Map<String, dynamic>>> getOrders({
    bool simulateError = false,
  }) async {
    print('[Orders] Loading...');

    await Future.delayed(const Duration(seconds: 4));

    if (simulateError) {
      throw Exception('Failed to load orders');
    }

    print('[Orders] Loaded successfully');

    return [
      {'id': 101, 'product': 'Keyboard', 'status': 'Delivered'},
      {'id': 102, 'product': 'Mouse', 'status': 'Processing'},
    ];
  }
}

Future<void> main() async {
  print('Laboratory work No. 11');
  print('Trots Oleksandr | IPZ-33');
  print('Asynchronous programming in Dart');
  print('==================================\n');

  final shop = OnlineShop();
  final stopwatch = Stopwatch()..start();

  try {
    print('Starting concurrent requests...\n');

    final results = await Future.wait<Object>([
      shop.getUser(),
      shop.getProducts(),
      shop.getOrders(),
    ]);

    final user = results[0] as Map<String, dynamic>;

    final products = results[1] as List<Map<String, dynamic>>;

    final orders = results[2] as List<Map<String, dynamic>>;

    stopwatch.stop();

    print('\n========== USER ==========');
    print('ID: ${user['id']}');
    print('Name: ${user['name']}');
    print('Email: ${user['email']}');

    print('\n======== PRODUCTS ========');

    for (final product in products) {
      print(
        '${product['id']}. ${product['name']} '
        '- ${product['price']} UAH',
      );
    }

    print('\n========= ORDERS =========');

    for (final order in orders) {
      print(
        'Order #${order['id']}: '
        '${order['product']} - ${order['status']}',
      );
    }

    print('\n======= PERFORMANCE =======');
    print('Sequential execution: approximately 9 seconds');
    print(
      'Concurrent execution: '
      '${(stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(2)} seconds',
    );
  } catch (error) {
    print('Error: $error');
  }

  print('\n======= ERROR HANDLING =======');

  try {
    await shop.getOrders(simulateError: true);
  } catch (error) {
    print('Handled error: $error');
  } finally {
    print('Error handling demonstration completed.');
  }

  print('\nProgram completed successfully.');
}
