import 'package:flutter/material.dart';
// Di bagian atas file:
import 'layanan_keliling.dart';
import 'pbb1.dart';
import 'pbb2.dart';
class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003566),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'LaPak Bantul',
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFFE9E7E5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Pusat Layanan Pajak Terpadu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFE9E7E5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/Group10.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

           // ================= BODY CARD =================
Container(
  width: double.infinity,
  decoration: const BoxDecoration(
    color: Color(0xFFF2F2F2),
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(30),
    ),
  ),
  padding: const EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // ===== GRID MENU =====
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
        children: [
          // Masukkan context dan const Pbb2() sebagai parameter
          _buildMenuItem(context, "PBB", const PBB2()), 
          _buildMenuItem(context, "BPHTB", const PBB2()),
          _buildMenuItem(context, "PAJAK DAERAH", const PBB2()),
         _buildMenuItem(context, "LAINNYA", const PBB2()),
        
        ],
      ),
      const SizedBox(height: 20),
      // ... kode selanjutnya
                  // ===== LAYANAN KELILING =====
                // ===== LAYANAN KELILING (BUTTON) =====
Material(
  color: const Color(0xFF003566), // Warna dasar tombol
  borderRadius: BorderRadius.circular(16),
  child: InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      // Navigasi ke halaman Layanan Keliling
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LayananKeliling()),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.local_shipping, color: Colors.white, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Layanan keliling",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Lihat jadwal layanan keliling",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
    ),
  ),
),
                  // ===== INFORMASI PAJAK =====
                  const Text(
                    "Informasi pajak",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF003566),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 // Pastikan parameter di dalam kurung ada tiga: context, title, dan targetPage
Widget _buildMenuItem(BuildContext context, String title, Widget targetPage) {
  return Material(
    color: const Color(0xFFE4E8EF),
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        // Navigasi ke halaman tujuan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.description, size: 32, color: Color(0xFF003566)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF003566),
            ),
          ),
        ],
      ),
    ),
  );
}}