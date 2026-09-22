import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'models.dart';

class AppProvider extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  AppUser? _currentUser;

  AppUser? get currentUser => _currentUser;

  // Constructor checks if user is already logged in
  AppProvider() {
    final session = _supabase.auth.currentSession;
    if (session != null) {
      _currentUser = AppUser(
        id: session.user.id,
        name: session.user.userMetadata?['full_name'] ?? 'User',
        email: session.user.email ?? '',
        password: '',
      );
    }
  }

  // --- SUPABASE SIGN UP ---
  // --- SUPABASE SIGN UP ---
  Future<String?> signUp(String name, String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': name},
      );

      if (response.user != null) {
        _currentUser = AppUser(
          id: response.user!.id,
          name: name,
          email: email,
          password: password,
        );
        notifyListeners();
        return null; // Success
      }
      return 'Sign up failed. Please try again.';
    } on AuthException catch (e) {
      // This catches Supabase auth errors (like "User already registered")
      print('SUPABASE AUTH ERROR: ${e.message}');
      return e.message;
    } catch (e) {
      // This catches network or database errors and shows the EXACT message
      print('UNEXPECTED SUPABASE ERROR: $e');
      return 'Error: ${e.toString()}';
    }
  }

  // --- SUPABASE LOG IN ---
  Future<String?> login(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        _currentUser = AppUser(
          id: response.user!.id,
          name: response.user!.userMetadata?['full_name'] ?? 'User',
          email: email,
          password: password,
        );
        notifyListeners();
        return null;
      }
      return 'Login failed. Please try again.';
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'An unexpected error occurred.';
    }
  }

  // --- SUPABASE LOG OUT ---
  Future<void> logout() async {
    await _supabase.auth.signOut();
    _currentUser = null;
    notifyListeners();
  }

  // Called from the Homepage when the user selects a role
  void setRole(UserRole role) {
    if (_currentUser != null) {
      _currentUser!.role = role;
      notifyListeners();
    }
  }
}