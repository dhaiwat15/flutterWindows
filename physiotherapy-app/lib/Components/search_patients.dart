import 'package:flutter/material.dart';

class SearchPatients extends SearchDelegate<String> {
  final List<String> patients;
  String results = "";

  SearchPatients(this.patients);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, results);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = patients.where((patients) {
      return patients.toLowerCase().startsWith(query.toLowerCase());
    });

    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(
          suggestions.elementAt(index),
        ),
        onTap: () {
          results = suggestions.elementAt(index);
          close(context, results);
        },
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = patients.where((patient) {
      return patient.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
          onTap: () {
            query = suggestions.elementAt(index);
          },
        );
      },
    );
  }
}
