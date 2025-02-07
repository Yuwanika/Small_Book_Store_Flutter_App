import 'package:flutter/material.dart';
import 'state_management.dart'; 
import 'app_drawer.dart';

class BookCartPage extends StatelessWidget {
  void removeFromCart(Map<String, String> book) {
    final currentCart = List<Map<String, String>>.from(CartState.cartItems.value);
    
    for (int i = 0; i < currentCart.length; i++) {
      if (currentCart[i]['title'] == book['title']) {
        currentCart.removeAt(i);
        break; 
      }
    }

    CartState.cartItems.value = currentCart;
  }

  void placeOrder() {
    OrderState.orderItems.value = [...OrderState.orderItems.value, ...CartState.cartItems.value];
    CartState.cartItems.value = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: const Color.fromARGB(255, 123, 9, 49), 
          iconTheme: IconThemeData(
          color: Colors.white,
      ),
      ),
      drawer: AppDrawer(), 
      body: ValueListenableBuilder<List<Map<String, String>>>(
        valueListenable: CartState.cartItems,
        builder: (context, cartItems, child) {
          return Column(
            children: [
              Expanded(
                child: cartItems.isEmpty
                    ? Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 16, color: Colors.grey)))
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: ListTile(
                              leading: Image.asset(item['image']!, width: 50, height: 70, fit: BoxFit.cover),
                              title: Text(item['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text("LKR. ${item['price']}", style: TextStyle(color: const Color.fromARGB(255, 129, 45, 68))),
                              trailing: ElevatedButton(
                                onPressed: () => removeFromCart(item),
                                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 147, 15, 6)),
                                child: Text('Remove', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: cartItems.isNotEmpty ? placeOrder : null,
                  child: Text('Buy All',style: TextStyle(color: const Color.fromARGB(255, 134, 10, 10))),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

