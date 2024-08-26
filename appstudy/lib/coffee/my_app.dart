import 'package:flutter/material.dart';
import 'coffee_list_screen.dart';
import 'favorite_screen.dart';
import 'plus_screen.dart'; // plus_screen.dart 파일을 임포트

// MyApp 클래스는 StatefulWidget을 상속받아 애플리케이션의 루트 위젯을 정의
class MyApp extends StatefulWidget {
  const MyApp({super.key}); // const 생성자

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // 선택된 인덱스 초기값
  List<Map<String, String>> _favorites = []; // 즐겨찾기 목록
  List<Map<String, String>> _coffees = [
    {
      'title': 'Espresso',
      'description': 'Strong and bold coffee.',
      'imagePath': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Latte',
      'description': 'Smooth and creamy coffee.',
      'imagePath': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Cappuccino',
      'description': 'Rich and foamy coffee.',
      'imagePath': 'https://via.placeholder.com/150'
    },
  ]; // 커피 목록에 더미 데이터 추가

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addCoffee(Map<String, String> newCoffee) {
    setState(() {
      _coffees.add(newCoffee);
      _selectedIndex = 0; // 커피 추가 후 목록 화면으로 이동
    });
  }

  void _toggleFavorite(Map<String, String> coffee) {
    setState(() {
      if (_favorites.contains(coffee)) {
        _favorites.remove(coffee);
      } else {
        _favorites.add(coffee);
      }
    });
  }

  void _removeFavorite(Map<String, String> coffee) {
    setState(() {
      _favorites.remove(coffee);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      CoffeeListScreen(
        coffees: _coffees,
        favorites: _favorites, // 추가된 부분
        onFavoriteToggle: _toggleFavorite, // 추가된 부분
      ),
      PlusScreen(onAddCoffee: _addCoffee),
      FavoriteScreen(
        favorites: _favorites,
        onRemoveFavorite: _removeFavorite, // 추가된 부분
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Coffee App'),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // 목록 아이콘
              label: 'home', // 목록 라벨
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add), // 추가 아이콘
              label: 'Add', // 추가 라벨
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite), // 즐겨찾기 아이콘
              label: 'Favorite', // 즐겨찾기 라벨
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}