import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  final String tag;

  const TagCard({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.black, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(tag, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
