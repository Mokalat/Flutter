import 'package:flutter/material.dart';
import 'coffee_card.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, String>> favorites;
  final Function(Map<String, String>) onRemoveFavorite; // 추가된 부분

  FavoriteScreen({required this.favorites, required this.onRemoveFavorite}); // 수정된 부분

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return CoffeeCard(
          title: favorites[index]['title']!,
          description: favorites[index]['description']!,
          imagePath: favorites[index]['imagePath']!,
          isFavorite: true, // 즐겨찾기 상태로 설정
          onFavoriteToggle: () => onRemoveFavorite(favorites[index]), // 수정된 부분
        );
      },
    );
  }
}