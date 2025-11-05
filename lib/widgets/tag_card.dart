import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/theme/base_theme.dart';
import '../utils/theme/theme_provider.dart';

class TagCard extends StatelessWidget {
  final String tag;

  const TagCard({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    BaseTheme baseTheme = themeProvider.colors;
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: baseTheme.borderColor, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(
          tag,
          style: TextStyle(fontSize: 16, color: baseTheme.textColor),
        ),
      ),
    );
  }
}
