import 'package:flutter/material.dart';

class Fragrance {
  String name;
  String description;

  Fragrance({required this.name, this.description = ''});

  Future<Map<String, String>> getFragranceData() async {
    //TODO: Implement fetching data from Firebase
    return Future.delayed(Duration(seconds: 2), () {
      return {'name': name, 'description': 'Fragrance Description'};
    });
  }
}

class FragranceInfoWidget extends StatelessWidget {
  FragranceInfoWidget({super.key});

  final Future<Map<String, String>> data =
      Fragrance(name: "AdG").getFragranceData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fragrance Info'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Card(
            child: Column(children: <Widget>[
          Card(
            child: Placeholder(),
          ),
          FutureBuilder<Map<String, String>>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final data = snapshot.data!;
                return Column(
                  children: [
                    Text(data['name'] ?? 'Default Name'),
                    Text(data['description'] ?? 'Default Description'),
                  ],
                );
              }
            },
          ),
        ])),
      ),
    );
  }
}
