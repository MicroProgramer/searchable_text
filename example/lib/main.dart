
import 'package:flutter/material.dart';
import 'package:searchable_text/text.dart';

class ExampleUsage extends StatelessWidget {
  const ExampleUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Searchable Text Example")),
      body: Center(
        child: SearchableText(
          "This is a sample text where 'sample' is highlighted.",
          searchTerm: "sample", // Search term to highlight
          highlightedTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          highlighterDecoration: BoxDecoration(
            color: Colors.yellow.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}