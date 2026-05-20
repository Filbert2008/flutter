import 'package:flutter/material.dart';
import 'detail_sppt.dart'; // Import halaman tujuan

class PBB2 extends StatelessWidget {
  const PBB2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'PBB',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView( // Tambahkan scroll agar tidak error saat layar penuh
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SearchBar(
                hintText: "Masukan NOP...", 
                leading: Icon(Icons.search),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PEMANGGILAN FUNGSI DENGAN PARAMETER CONTEXT
                  _buildSPPT(
                    context,
                    "SPPT 2021",
                    "DS. Ngireng-ireng RT01/RW01",
                    "Njop Bumi dan Bangunan",
                    "200,000",
                    false,
                  ),
                  const SizedBox(height: 15),
                  _buildSPPT(
                    context,
                    "SPPT 2020",
                    "DS. Ngireng-ireng RT01/RW01",
                    "Njop Bumi dan Bangunan",
                    "376,000",
                    true,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FUNGSI BUILDER YANG SUDAH MENJADI TOMBOL
  Widget _buildSPPT(
    BuildContext context,
    String title,
    String location,
    String text,
    String uang,
    bool isLunas,
  ) {
    return Material( // Gunakan Material agar efek ripple InkWell terlihat
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // NAVIGASI KE DETAIL SPPT
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailSPPT()),
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: isLunas ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isLunas ? "Lunas" : "Belum Lunas",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 18),
                  const SizedBox(width: 5),
                  Text(location, style: const TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  const Icon(Icons.attach_money_rounded, size: 18),
                  const SizedBox(width: 5),
                  Text(text, style: const TextStyle(fontSize: 14)),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      uang,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 30), // Pemisah visual
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Lihat Detail",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey, size: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateItem(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.indigo[900] : Colors.indigo[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_month,
            color: isSelected ? Colors.yellow : Colors.black,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}