import 'package:flutter/material.dart';

class Category with ChangeNotifier{
  final String id;
  final String title;
  final String imageUrl;

   Category({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  bool _disposed =false ;


  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }



}