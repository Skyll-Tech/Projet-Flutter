import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vente de Vélos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bicycle> bicycles = [
    Bicycle(
      name: 'Vélo de ville',
      description: 'Un vélo confortable pour les trajets quotidiens',
      price: 499.99,
      imageAsset: 'assets/images/velo1.jpg',
    ),
    Bicycle(
      name: 'Vélo de montagne',
      description: 'Un vélo tout-terrain pour les aventures en pleine nature',
      price: 799.99,
      imageAsset: 'assets/images/velo2.jpg',
    ),
    Bicycle(
      name: 'Vélo de course',
      description: 'Un vélo rapide et léger pour les cyclistes passionnés',
      price: 999.99,
      imageAsset: 'assets/images/velo3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vente de Vélos'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: bicycles.length,
        itemBuilder: (context, index) {
          return BicycleCard(bicycle: bicycles[index]);
        },
      ),
    );
  }
}

class BicycleCard extends StatelessWidget {
  final Bicycle bicycle;

  BicycleCard({required this.bicycle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/${bicycle.imageAsset}',
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              bicycle.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              bicycle.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              '${bicycle.price.toStringAsFixed(2)} €',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Bicycle {
  final String name;
  final String description;
  final double price;
  final String imageAsset;

  Bicycle({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
  });
}