import 'package:flutter/material.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'Item $index');
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(8),
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                
                child: Center(child: Text('$item - Top')),
              ),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Text('$item - Bottom',textAlign: TextAlign.center,),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}