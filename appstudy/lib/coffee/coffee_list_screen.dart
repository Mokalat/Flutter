import 'package:flutter/material.dart';
import 'coffee_card.dart';

class CoffeeListScreen extends StatelessWidget {
  final List<Map<String, String>> coffees;
  final List<Map<String, String>> favorites; // 추가된 부분
  final Function(Map<String, String>) onFavoriteToggle; // 추가된 부분

  CoffeeListScreen({required this.coffees, required this.favorites, required this.onFavoriteToggle}); // 수정된 부분

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coffees.length,
      itemBuilder: (context, index) {
        return CoffeeCard(
          title: coffees[index]['title']!,
          description: coffees[index]['description']!,
          imagePath: coffees[index]['imagePath']!,
          isFavorite: favorites.contains(coffees[index]), // 추가된 부분
          onFavoriteToggle: () => onFavoriteToggle(coffees[index]), // 수정된 부분
        );
      },
    );
  }
}