import 'package:flutter/material.dart';

class PatientListVM with ChangeNotifier {
  final TextEditingController searchTEC = TextEditingController();

  String searchQuery = "Search query";

  bool _isSearching = false;

  bool get isSearching => _isSearching;

  set isSearching(bool val) {
    _isSearching = val;
    notifyListeners();
  }

  void startSearch(bool val) {
    _isSearching = val;
    notifyListeners();
  }

  void updateSearchQuery(String newQuery) {
    searchQuery = newQuery;
    notifyListeners();
  }

  void stopSearching(bool val) {
    clearSearchQuery();
    _isSearching = val;
    notifyListeners();
  }

  void clearSearchQuery() {
    searchTEC.clear();
    updateSearchQuery("");
    notifyListeners();
  }
}
