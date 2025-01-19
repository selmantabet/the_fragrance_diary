import 'package:flutter/material.dart';

class WardrobeWidget extends StatefulWidget {
  const WardrobeWidget({super.key});

  @override
  State<WardrobeWidget> createState() => _WardrobeWidgetState();
}

class _WardrobeWidgetState extends State<WardrobeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wardrobe'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            const Center(
              child: Text('Welcome to Wardrobe Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fragrance_info');
              },
              child: const Text('Fragrance Info'),
            ),
          ],
        ),
      ),
    );
  }
}
