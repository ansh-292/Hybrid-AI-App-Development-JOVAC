import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Items",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FoodMenuScreen(),
    );
  }
}

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  final List<Map<String, dynamic>> foodItems = const [
    {
      "name": "Pizza",
      "price": "₹599",
      "icon": Icons.local_pizza,
    },
    {
      "name": "Gourmet Burger",
      "price": "₹349",
      "icon": Icons.lunch_dining,
    },
    {
      "name": "Noodles",
      "price": "₹249",
      "icon": Icons.ramen_dining,
    },
    {
      "name": "Tomato Soup",
      "price": "₹199",
      "icon": Icons.soup_kitchen,
    },
    {
      "name": "Classic Dessert",
      "price": "₹199",
      "icon": Icons.cake,
    },
    {
      "name": "Mango Lassi",
      "price": "₹99",
      "icon": Icons.local_drink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Food Items"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.separated(

                itemCount: foodItems.length,

                separatorBuilder: (context, index) =>
                    const Divider(height: 12),

                itemBuilder: (context, index) {

                  final item = foodItems[index];

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: ListTile(

                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),

                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.green.shade100,
                        child: Icon(
                          item["icon"],
                          color: Colors.green,
                          size: 30,
                        ),
                      ),

                      title: Text(
                        item["name"],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        item["price"],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),

                      trailing: const Icon(
                        Icons.shopping_cart,
                        color: Colors.green,
                        size: 34,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}