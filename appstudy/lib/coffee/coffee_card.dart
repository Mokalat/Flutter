import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isFavorite; // 추가된 부분
  final VoidCallback onFavoriteToggle; // 수정된 부분

  CoffeeCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isFavorite, // 추가된 부분
    required this.onFavoriteToggle, // 수정된 부분
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(imagePath),
        title: Text(title),
        subtitle: Text(description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey, // 하트 색상 변경
              ),
              onPressed: onFavoriteToggle,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}