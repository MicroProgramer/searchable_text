import 'package:flutter/material.dart';

/// A widget for displaying text with highlighted search terms.
class SearchableText extends StatelessWidget {
  /// Original text to display.
  final String text;

  /// Term to highlight.
  final String searchTerm;

  /// Style for non-highlighted text.
  final TextStyle? style;

  /// Style for highlighted text.
  final TextStyle? highlightedTextStyle;

  /// Decoration for highlighted area (optional).
  /// Default is a yellow container
  ///
  /// ```dart
  /// BoxDecoration(
  ///                   color: Colors.yellow,
  ///                   borderRadius: BorderRadius.circular(8.0),
  ///                 )
  /// ```

  final BoxDecoration? highlighterDecoration;

  /// Creates a text widget with highlighted search terms.
  ///
  /// The [text] parameter is the original text to be displayed.
  ///
  /// The [searchTerm] parameter is the term to search for and highlight.
  ///
  /// The [style] parameter defines the style for non-highlighted text.
  ///
  /// The [highlightedTextStyle] parameter defines the style for highlighted text.
  ///
  /// The [highlighterDecoration] parameter defines decoration for the highlighted area.
  const SearchableText(
    this.text, {
    super.key,
    required this.searchTerm,
    this.style,
    this.highlightedTextStyle,
    this.highlighterDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _highlightOccurrences,
    );
  }

  List<Widget> get _highlightOccurrences {
    final List<Widget> widgets = [];
    final String lowerCaseText = text.toLowerCase();
    final String lowerCaseSearchTerm = searchTerm.toLowerCase();
    final List<String> parts = lowerCaseSearchTerm.isEmpty ? [lowerCaseText] : lowerCaseText.split(lowerCaseSearchTerm);

    int startIndex = 0;

    for (String part in parts) {
      if (lowerCaseText.indexOf(part, startIndex) != -1) {
        widgets.add(Text(
          text.substring(startIndex, startIndex + part.length),
          style: style,
        ));
        startIndex += part.length;
      }

      if (startIndex < text.length) {
        widgets.add(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            decoration: highlighterDecoration ??
                BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8.0),
                ),
            child: Text(
              text.substring(startIndex, startIndex + lowerCaseSearchTerm.length),
              style: highlightedTextStyle ?? const TextStyle(color: Colors.black),
            ),
          ),
        );
        startIndex += lowerCaseSearchTerm.length;
      }
    }

    return widgets;
  }
}