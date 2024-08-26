import 'package:flutter/material.dart';
import 'package:validators/validators.dart'; // URL 유효성 검사를 위해 validators 패키지 사용

// PlusScreen 클래스는 StatefulWidget을 상속받아 등록 페이지를 정의
class PlusScreen extends StatefulWidget {
  final Function(Map<String, String>) onAddCoffee; // 커피 추가 콜백

  PlusScreen({required this.onAddCoffee});

  @override
  _PlusScreenState createState() => _PlusScreenState();
}

class _PlusScreenState extends State<PlusScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imagePathController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imagePathController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newCoffee = {
        'title': _titleController.text,
        'description': _descriptionController.text,
        'imagePath': _imagePathController.text.isEmpty || !isURL(_imagePathController.text)
            ? 'https://via.placeholder.com/150' // 기본 이미지 URL
            : _imagePathController.text,
      };
      widget.onAddCoffee(newCoffee);
      Navigator.pop(context); // 폼 제출 후 이전 화면으로 돌아감
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Coffee'), // 앱바의 제목 설정
      ),
      body: SingleChildScrollView( // 추가된 부분
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imagePathController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value != null && value.isNotEmpty && !isURL(value)) {
                    return 'Please enter a valid URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Coffee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}