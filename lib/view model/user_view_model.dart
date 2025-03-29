  import 'package:flutter/material.dart';
import 'package:userinfo/apiService/user_service.dart';
import 'package:userinfo/model/user_model.dart';



class UserViewModel with ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch users Details
  Future<void> fetchUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await ApiService().fetchUsers();
    } catch (e) {
      _errorMessage = 'Failed to load users';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete  user locally
  void deleteUser(int userId) {
    _users.removeWhere((user) => user.id == userId);
    notifyListeners();
  }
}
