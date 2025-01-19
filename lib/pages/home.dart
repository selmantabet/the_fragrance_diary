import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/wardrobe');
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.shelves, color: Colors.black, size: 30.0),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.grey[400],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.local_florist,
                    size: 100.0,
                    color: Colors.green,
                  ),
                  Text(
                    'The Fragrance Diary',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text('Where are you off to today?',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.sentiment_very_satisfied),
                onPressed: () {},
                label: const Text('Going Out - Casual'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.group),
                onPressed: () {},
                label: const Text('Going Out - Formal'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
                label: const Text('Date Night'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.work),
                onPressed: () {},
                label: const Text('Work'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.sentiment_very_satisfied),
                onPressed: () {},
                label: const Text('Special Occasion'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Surprise Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
