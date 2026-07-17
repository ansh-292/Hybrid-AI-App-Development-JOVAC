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
      title: "Smart Café",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SmartCafeScreen(),
    );
  }
}

class SmartCafeScreen extends StatefulWidget {
  const SmartCafeScreen({super.key});

  @override
  State<SmartCafeScreen> createState() => _SmartCafeScreenState();
}

class _SmartCafeScreenState extends State<SmartCafeScreen> {

  String selectedCategory = "Burger";
  int quantity = 1;

  final Map<String, Map<String, String>> menu = {
    "Burger": {
      "name": "Veg Burger",
      "price": "₹120",
      "description": "Delicious veg burger with fresh veggies and cheese.",
      "image": "assets/burger.png",
    },
    "Pizza": {
      "name": "Pepperoni Pizza",
      "price": "₹250",
      "description": "Loaded with cheese and pepperoni.",
      "image": "assets/pizza.png",
    },
    "Sandwich": {
      "name": "Grilled Sandwich",
      "price": "₹180",
      "description": "Fresh grilled sandwich with vegetables.",
      "image": "assets/sandwich.png",
    },
    "Cold Coffee": {
      "name": "Cold Coffee",
      "price": "₹150",
      "description": "Creamy chilled cold coffee.",
      "image": "assets/coffee.png",
    },
    "French Fries": {
      "name": "French Fries",
      "price": "₹100",
      "description": "Crispy fries served with dip.",
      "image": "assets/fries.png",
    },
  };

  @override
  Widget build(BuildContext context) {

    final item = menu[selectedCategory]!;

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text("Smart Café"),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              ),
              PopupMenuItem(
                value: "Help",
                child: Text("Help"),
              ),
            ],
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.restaurant_menu),
        onPressed: () {},
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Choose Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 8),

            Container(

              padding: const EdgeInsets.symmetric(horizontal: 12),

              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12),
              ),

              child: DropdownButtonHideUnderline(

                child: DropdownButton<String>(

                  value: selectedCategory,

                  isExpanded: true,

                  items: const [

                    DropdownMenuItem(
                      value: "Burger",
                      child: Text("🍔 Burger"),
                    ),

                    DropdownMenuItem(
                      value: "Pizza",
                      child: Text("🍕 Pizza"),
                    ),

                    DropdownMenuItem(
                      value: "Sandwich",
                      child: Text("🥪 Sandwich"),
                    ),

                    DropdownMenuItem(
                      value: "Cold Coffee",
                      child: Text("☕ Cold Coffee"),
                    ),

                    DropdownMenuItem(
                      value: "French Fries",
                      child: Text("🍟 French Fries"),
                    ),

                  ],

                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Selected Item",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            Card(

              elevation: 5,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Padding(

                padding: const EdgeInsets.all(12),

                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item["image"]!,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(

                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(
                            item["name"]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            item["description"]!,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            item["price"]!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    PopupMenuButton<String>(

                      itemBuilder: (context) => const [

                        PopupMenuItem(
                          value: "Cheese",
                          child: Text("🧀 Add Cheese"),
                        ),

                        PopupMenuItem(
                          value: "Sauce",
                          child: Text("🧴 Extra Sauce"),
                        ),

                        PopupMenuItem(
                          value: "Nutrition",
                          child: Text("🥗 View Nutrition"),
                        ),

                        PopupMenuItem(
                          value: "Share",
                          child: Text("📤 Share Item"),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Quantity",
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(

              children: [

                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.deepPurple.shade100,
                  child: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                ),

                const SizedBox(width: 20),

                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 20),

                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.deepPurple.shade100,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.shopping_cart),
                label: const Text(
                  "Place Order",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "${item["name"]} x$quantity Ordered Successfully!",
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  side: const BorderSide(color: Colors.deepPurple),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.bookmark_border),
                label: const Text(
                  "Save for Later",
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Saved for later"),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: TextButton.icon(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                label: const Text(
                  "Clear Selection",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    quantity = 1;
                    selectedCategory = "Burger";
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 15),

            const Center(
              child: Text(
                "Order on iPhone Style",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.phone_iphone),
                label: const Text(
                  "Order on iPhone Style",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [

                    const Text(
                      "🎉",
                      style: TextStyle(fontSize: 45),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text(
                            "Today's Special",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            item["name"]!,
                            style: const TextStyle(fontSize: 16),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            item["price"]!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.deepPurple,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [

                      Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Order Placed Successfully!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    "DISMISS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}