import 'package:flutter/material.dart';
import '../models/user_model.dart'; // PERBAIKAN: Mengarah ke folder models
import '../auth/login_page.dart';    // PERBAIKAN: Mengarah ke folder auth

class UsersPage extends StatelessWidget {
  final UserModel user; // Menerima data user yang sedang login

  const UsersPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003566), // Navy Blue khas LaPak Bantul
      appBar: AppBar(
        title: const Text('Profil Pengguna', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Avatar dan Nama Pengguna di Bagian Atas
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.yellow[700],
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFF003566),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    user.name ?? 'Nama Tidak Diketahui',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user.role?.toUpperCase() ?? 'WARGA',
                    style: TextStyle(fontSize: 14, color: Colors.yellow[400], fontWeight: FontWeight.w600, letterSpacing: 1.2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),

            // Kontainer Putih Bagian Bawah untuk Detail Informasi
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 300,
              ),
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Informasi Akun",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF003566)),
                  ),
                  const SizedBox(height: 20),

                  // List Data Profil
                  _buildProfileItem(Icons.badge_outlined, "NIK", user.nik ?? "-"),
                  _buildProfileItem(Icons.email_outlined, "Email", user.email ?? "-"),
                  _buildProfileItem(Icons.phone_android_outlined, "Nomor Telepon", user.phoneNumber ?? "-"),
                  
                  const Divider(height: 40, thickness: 1),
                  const Text(
                    "Pengaturan Aplikasi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF003566)),
                  ),
                  const SizedBox(height: 10),

                  // Opsional Menu Tambahan
                  _buildMenuAction(Icons.lock_reset_outlined, "Ubah Password", () {
                    // Aksi ubah password
                  }),
                  _buildMenuAction(Icons.help_outline_rounded, "Bantuan & Layanan", () {
                    // Aksi bantuan
                  }),

                  const SizedBox(height: 30),

                  // Tombol Logout
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () => _showLogoutDialog(context),
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text(
                        "Keluar dari Akun",
                        style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red, width: 1.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Baris Informasi
  Widget _buildProfileItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF003566).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF003566)),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }

  // Widget Helper untuk Tombol Menu Action
  Widget _buildMenuAction(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: const Color(0xFF003566)),
      title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  // Dialog Konfirmasi Keluar
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Keluar Akun'),
        content: const Text('Apakah Anda yakin ingin keluar dari aplikasi LaPak Bantul?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text('Keluar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}