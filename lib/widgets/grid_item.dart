import 'package:flutter/material.dart';


class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.title,
    required this.onSelectGrid,
  });

  final String title;
  final void Function() onSelectGrid;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectGrid,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.cyan.withOpacity(0.55),
              Colors.blue.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
