import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screens/home_page.dart'; // Menggunakan HomePage sesuai file Anda
import 'register_page.dart'; // Import halaman pendaftaran
import 'forgot_password_page.dart'; // Import halaman lupa password

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isLoading = false; // State untuk mendeteksi proses loading API

  // Fungsi untuk memproses Login ke REST API
  Future<void> _loginAction() async {
    // Validasi form lokal terlebih dahulu
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    // Sesuaikan URL ini dengan endpoint REST API backend Anda
    final Uri url = Uri.parse('https://api.lapakbantul.com/v1/login'); 

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email_or_nik': _emailController.text.trim(),
          'password': _passwordController.text,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // REQUEST BERHASIL
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Berhasil!'), backgroundColor: Colors.green),
          );
          
          // Pindah ke halaman utama dan hapus tumpukan halaman login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      } else {
        // REQUEST GAGAL (Contoh: Password salah / Akun tidak terdaftar)
        String errorMessage = data['message'] ?? 'Gagal masuk, periksa data Anda.';
        _showErrorDialog(errorMessage);
      }
    } catch (e) {
      // MASALAH JARINGAN / SERVER TIMEOUT
      _showErrorDialog('Tidak dapat terhubung ke server. Periksa koneksi internet Anda.');
    } finally { // <--- PERBAIKAN: Diubah dari 'final' menjadi 'finally'
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Helper untuk menampilkan dialog error
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Gagal Login'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003566),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Pasang GlobalKey untuk validasi
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Icon(Icons.account_balance_wallet, size: 80, color: Colors.yellow),
              const SizedBox(height: 20),
              const Text(
                'LaPak Bantul',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const Text(
                'Silahkan login untuk melanjutkan',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 50),
              
              // Form Container
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF003566)),
                    ),
                    const SizedBox(height: 20),
                    
                    // Input Email / NIK
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email / NIK',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email atau NIK tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Input Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        if (value.length < 6) {
                          return 'Password minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                    
                    // Tombol Lupa Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                          );
                        },
                        child: const Text("Lupa Password?"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Tombol Login / Loading Indicator
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _loginAction,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF003566),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "Masuk",
                                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Navigasi ke Daftar Akun
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Belum punya akun?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()),
                            );
                          }, 
                          child: const Text("Daftar sekarang"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}