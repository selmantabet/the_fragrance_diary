import 'package:flutter/material.dart';

class Fragrance {
  String name;
  String description;

  Fragrance({required this.name, this.description = ''});

  Future<void> getFragranceData() async {
    //TODO: Implement fetching data from Firebase
    return Future.delayed(Duration(seconds: 2), () {
      name = 'Fragrance Name';
      description = 'Fragrance Description';
    });
  }
}

class FragranceInfoWidget extends StatelessWidget {
  FragranceInfoWidget({super.key});

  final Map<String, String> data = {
    'name': 'Fragrance Name',
    'description': 'Fragrance Description',
  };

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      Card(
        child: Placeholder(),
      ),
      Text(data['name'] ?? 'Default Name'),
      Text(data['description'] ?? 'Default Description'),
    ]));
  }
}
