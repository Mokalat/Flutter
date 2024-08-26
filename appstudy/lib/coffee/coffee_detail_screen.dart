import 'package:flutter/material.dart';

// CoffeeDetailScreen 클래스는 StatelessWidget을 상속받아 커피 상세보기 화면을 정의
class CoffeeDetailScreen extends StatelessWidget {
  final String title; // 커피 제목
  final String description; // 커피 설명
  final String imagePath; // 커피 이미지 경로

  CoffeeDetailScreen({
    required this.title,
    required this.description,
    required this.imagePath,
  }); // 생성자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // 앱바의 제목 설정
      ),
      body: SingleChildScrollView( // SingleChildScrollView로 감싸서 스크롤 가능하게 만듦
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imagePath), // 네트워크 이미지 로드
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), // 커피 제목
            SizedBox(height: 8.0),
            Text(description), // 커피 설명
          ],
        ),
      ),
    );
  }
}