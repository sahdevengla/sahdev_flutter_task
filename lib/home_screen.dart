import 'package:flutter/material.dart';
import 'add_ product_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue.shade100,
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.blue.shade700),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      // Implement search logic if necessary
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ProductList(), 
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          ).then((value) => setState(() {}));
        },
        backgroundColor: Colors.blue.shade700,
        child: Icon(Icons.add),
      ),
    );
  }
}

