import 'package:agric/pages/home_page.dart';
import 'package:agric/pages/main_page.dart';
import 'package:flutter/material.dart';


class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              _buildItem(context, 'E-commerce', 'assets/ecommerce.jpeg'),
              _buildItem(context, 'Loans', 'assets/loans.jpg'),
              _buildItem(context, 'Weather', 'assets/weather.webp'),
              _buildItem(context, 'Farming Tips and Management', 'assets/farm.jpeg'),
              _buildItem(context, 'Account', 'assets/account.jpeg'),
              _buildItem(context, 'Insurance', 'assets/insurance.jpeg'),
              _buildItem(context, 'Contact Us', 'assets/contact.jpg'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          leading: Image.asset(
            imagePath,
            width: 50,
            height: 40,
            fit: BoxFit.cover,
          ),
          onTap: () {
            // Navigate to respective pages based on the item clicked
            // Add your navigation logic here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
        ),
      ),
    );
  }
}

