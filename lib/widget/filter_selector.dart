import 'package:flutter/material.dart';

class FilterSelector extends StatelessWidget {
  const FilterSelector({
    Key? key,
    required this.filters,
    required this.onFilterChanged,
  }) : super(key: key);

  final List<Color> filters;
  final Function(Color) onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final color = filters[index];
          return GestureDetector(
            onTap: () => onFilterChanged(color),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
