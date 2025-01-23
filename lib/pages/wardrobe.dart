import 'package:flutter/material.dart';
import 'package:the_fragrance_diary/dependency_injection.dart';
import 'package:the_fragrance_diary/models/fragrance.dart';
import 'package:the_fragrance_diary/services/database_service.dart';

class WardrobeWidget extends StatefulWidget {
  const WardrobeWidget({super.key});

  @override
  State<WardrobeWidget> createState() => _WardrobeWidgetState();
}

class _WardrobeWidgetState extends State<WardrobeWidget> {
  String _newFragranceName = '';
  String _newFragranceDescription = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wardrobe'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: _fragranceList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Add Fragrance'),
                content: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: 'Name'),
                          onChanged: (name) {
                            _newFragranceName = name;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Description'),
                          onChanged: (description) {
                            _newFragranceDescription = description;
                          },
                        ),
                        MaterialButton(
                            onPressed: () {
                              if (_newFragranceDescription == '' ||
                                  _newFragranceName == '') {
                                return;
                              }
                              locator<DatabaseService>().insertFragrance({
                                'name': _newFragranceName,
                                'description': _newFragranceDescription,
                                'imagePath': 'assets/images/fragrance.png'
                              });
                              setState(() {
                                _newFragranceName = '';
                                _newFragranceDescription = '';
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text('Confirm')),
                      ],
                    )),
              ),
            );
          },
          child: Icon(Icons.add),
        ));
  }

  Widget _fragranceList() {
    return FutureBuilder<List<Fragrance>>(
        future: locator<DatabaseService>().queryAllRows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Fragrance fragrance = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(fragrance.name),
                    subtitle: Text(fragrance.description),
                    trailing: IconButton(
                        onPressed: () {
                          locator<DatabaseService>()
                              .deleteFragrance(fragrance.id);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete)),
                  ),
                );
              },
            );
          }
        });
  }
}
