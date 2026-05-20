import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  // Base URL API LaPak Bantul
  static const String baseUrl = 'https://api.lapakbantul.com/v1';

  // Header Standar untuk Request JSON
  static Map<String, String> _getHeaders({String? token}) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  /// Fungsi Penanganan Login
  /// Mengembalikan Map berisi 'user' (UserModel) dan 'token' (String) jika sukses
  static Future<Map<String, dynamic>> login(String emailOrNik, String password) async {
    final Uri url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: _getHeaders(),
        body: jsonEncode({
          'email_or_nik': emailOrNik,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Berhasil login
        return {
          'success': true,
          'user': UserModel.fromJson(data['user']),
          'token': data['token'] ?? '',
          'message': data['message'] ?? 'Login Berhasil!',
        };
      } else {
        // Gagal dari sisi API (Password salah / User tidak ada)
        return {
          'success': false,
          'message': data['message'] ?? 'Gagal masuk, periksa rincian data Anda.',
        };
      }
    } catch (e) {
      // Masalah Jaringan / Timeout
      return {
        'success': false,
        'message': 'Tidak dapat terhubung ke server. Periksa koneksi internet Anda.',
      };
    }
  }

  /// Fungsi untuk mengambil data profil terbaru (jika sewaktu-waktu dibutuhkan)
  static Future<Map<String, dynamic>> getUserProfile(String token) async {
    final Uri url = Uri.parse('$baseUrl/user');

    try {
      final response = await http.get(
        url,
        headers: _getHeaders(token: token),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'user': UserModel.fromJson(data['user']),
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Gagal mengambil data profil.',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Gagal terhubung ke server.',
      };
    }
  }
}