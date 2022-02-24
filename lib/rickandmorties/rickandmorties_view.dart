import 'package:flutter/material.dart';
import './rickandmorties_viewmodel.dart';

class RickandmortiesView extends RickandmortiesViewModel {
  final String nullImage =
      "https://rickandmortyapi.com/api/character/avatar/1.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty characters"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(models[index].name ?? "null name"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(models[index].image ?? nullImage),
              ),
              subtitle: Text(models[index].gender ?? "null gender"),
              trailing: Text(
                  models[index].created?.toString() ?? "null created time"),
            ),
          );
        },
        itemCount: models.length,
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchAllData),
    );
  }
}
