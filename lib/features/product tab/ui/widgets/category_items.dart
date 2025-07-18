import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final List<String> items;

  const CategoryItems({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return Card(child: Center(child: Text(items[index])));
          },
        ),
      ),
    );
  }
}
