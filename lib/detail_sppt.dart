import 'package:flutter/material.dart';

class DetailSPPT extends StatelessWidget {
  const DetailSPPT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "No. NOP 378429749820294337",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              "AHMAD NABIL BAHROIN ROGER SUMATRA",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 14),
                children: [
                  TextSpan(
                    text: "Alamat Lengkap WP : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        "Kab Bantul, Kec. Sewon, DS. Ngireng-ireng, RT01/RW01",
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              width: double.infinity,

              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      _buildDetail("Lokasi", "DS. Ngireng-ireng, RT01/RW01"),
                      Text(
                        "Status",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Sudah Lunas",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(color: Colors.black),
                      _buildDetail("Denda", "Rp. 0"),
                      _buildDetail("NJOP Bumi", "Rp. 300,000"),
                      _buildDetail("NJOP Bangunan", "Rp.0"),
                      _buildDetail("Luas Bumi", "227m"),
                      _buildDetail("Luas Bangunan", "227m"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String title, String text) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),

          Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Divider(color: Colors.black),
        ],
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
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
