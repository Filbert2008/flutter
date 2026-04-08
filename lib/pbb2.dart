import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            SizedBox(height: 20),

            SearchBar(hintText: "Masukan NOP...", leading: Icon(Icons.search)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Padding(padding: const EdgeInsets.only(top: 20)),
                  const SizedBox(height: 10),
                  _buildSPPT(
                    "SPPT 2021",
                    "DS. Ngireng-ireng RT01/RW01",
                    "Njop Bumi dan Bangunan",
                    "200,000",
                    false,
                  ),
                  const SizedBox(height: 10),
                  _buildSPPT(
                    "SPPT 2020",
                    "DS. Ngireng-ireng RT01/RW01",
                    "Njop Bumi dan Bangunan",
                    "376,000",
                    true,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSPPT(
    String title,
    String location,
    String text,
    String uang,
    bool isLunas,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isLunas ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isLunas ? "Lunas" : "Belum Lunas",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.black),
              Text(
                location,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Icon(Icons.attach_money_rounded, color: Colors.black),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              Container(
                    margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
            
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
