
import 'package:flutter/material.dart';
import 'package:searchable_text/text.dart';

class MySearchableTextScreen extends StatelessWidget {
  const MySearchableTextScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var searchQuery = "";
    List<Models> results = [];

    return Scaffold(
      appBar: AppBar(title: const Text('Searchable Text Example')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var item = results[index];
          return ListTile(
            title: SearchableText(
              item.name,
              style: TextStyle(
                color: Themes.textColor,
                fontSize: 11.sp,
                fontFamily: 'nexaRegular',
              ),
              searchTerm: searchQuery.value,
            ),
          );
        },
        itemCount: results.length,
      ),
    );
  }
}