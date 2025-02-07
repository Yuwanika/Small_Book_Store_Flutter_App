import 'package:flutter/material.dart';
import 'state_management.dart';

class BookList extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'The Hate U Give',
      'author': 'Angie Thomas',
      'price': '1545',
      'image': 'assets/images/book1.jpg',
      'about': 'The Hate U Give follows sixteen-year-old Starr as she navigates the divide between her poor neighborhood and wealthy school while finding her voice after witnessing a police shooting.',
    },
    {
      'title': 'Harry Potter and the Philosopher’s Stone',
      'author': 'J.K. Rowling',
      'price': '3240',
      'image': 'assets/images/book2.jpg',
      'about': 'Harry Potter discovers he is a wizard when he receives a letter inviting him to Hogwarts, beginning his magical journey.',
    },
    {
      'title': 'Heroes of Olympus The House of Hades',
      'author': 'RICK, RIORDAN',
      'price': '950',
      'image': 'assets/images/book3.jpg',
      'about': 'Percy and Annabeth must escape Tartarus while their friends fight to close the Doors of Death and stop Gaea’s rise.',
    },
    {
      'title': 'Madol Duwa',
      'author': 'Martin Wickramasinghe',
      'price': '425',
      'image': 'assets/images/book4.jpeg',
      'about': 'Madol Doova is a beloved Sri Lankan novel about Upali, a rebellious boy, and his friend Jinna, who seek adventure and independence on a deserted island, showcasing their courage, resilience, and resourcefulness.',
    },
    {
      'title': 'We Must Be Brave',
      'author': 'Frances Liardet',
      'price': '2650',
      'image': 'assets/images/book5.jpg',
      'about': 'We Must Be Brave is a poignant novel about love, sacrifice, and unexpected motherhood as a woman finds an abandoned child during wartime and discovers how rescuing others can transform her own life.',
    },
  ];

  void addToCart(Map<String, String> book) {
    CartState.cartItems.value = [...CartState.cartItems.value, book];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          elevation: 3,
          child: ListTile(
            leading: Image.asset(book['image']!, width: 50, height: 70, fit: BoxFit.cover),
            title: Text(book['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book['author']!, style: TextStyle(color: const Color.fromARGB(255, 15, 15, 15))),
                Text("\LKR.${book['price']}", style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 129, 45, 68))),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(book['title']!),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(book['image']!, width: 100, height: 140, fit: BoxFit.cover),
                          SizedBox(height: 10),
                          Text('Author: ${book['author']}'),
                          Text('Price: LKR. ${book['price']}'),
                          SizedBox(height: 10),
                          Text('Description:'),
                          Text(book['about']!, style: TextStyle(fontStyle: FontStyle.italic)),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            addToCart(book);
                            Navigator.of(context).pop();
                          },
                          child: Text('Add to Cart', style: TextStyle(color: const Color.fromARGB(255, 134, 10, 10))),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close', style: TextStyle(color: const Color.fromARGB(255, 134, 10, 10))),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('View Details', style: TextStyle(color: const Color.fromARGB(255, 134, 10, 10))),
            ),
          ),
        );
      },
    );
  }
}
