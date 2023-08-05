# Searchable Text Widget

The **Searchable Text Widget** is a Flutter package that offers a flexible and customizable way to display text with highlighted search terms. This widget is particularly useful for scenarios where you want to provide a user-friendly way of emphasizing specific terms within a body of text.

## Features

- Display text with highlighted search terms.
- Customize the appearance of both highlighted and non-highlighted text.
- Define a decoration for the highlighted area.
- Simple integration into your Flutter application.

## Installation

To use the **Searchable Text Widget** in your Flutter project, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  searchable_text: ^1.0.0  # Replace with the latest version
```
Then, run `flutter pub get` to fetch the package.

## Usage

Import the package into your Dart file:

```dart
import 'package:flutter/material.dart';
import 'package:searchable_text/searchable_text.dart';
```

Use the `SearchableText` widget within your widget tree:

```dart
class MySearchableTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var searchQuery = "".obs;
    List<Models> results = [];
    
    return Scaffold(
      appBar: AppBar(title: Text('Searchable Text Example')),
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
```


## Attributes
  * `text`: Original text to display.
  * `searchTerm`: Term to highlight.
  * `style`: Style for non-highlighted text.
  * `highlightedTextStyle`: Style for highlighted text.
  * `highlighterDecoration`: Decoration for the highlighted area.

## License
This package is released under the [MIT License](https://opensource.org/licenses/MIT).

