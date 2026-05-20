import 'package:flutter/material.dart';

class LayananKeliling extends StatelessWidget {
  const LayananKeliling({super.key});

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
          'Layanan Keliling',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: [
                  _dateItem('21/01/2024', true),
                  _dateItem('25/01/2024', false),
                  _dateItem('28/01/2024', false),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Padding(padding: const EdgeInsets.only(top: 20)),
                  Text(
                    "Hari ini, 21 Januari 2024",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  _buildServiceItem(
                    "Mobil 01",
                    "Mangir lor & Manager tengah, sendang",
                    "08:00 - 16:00",
                  ),
                  const SizedBox(height: 10),
                  _buildServiceItem(
                    "Mobil 02",
                    "Mangir lor & Manager tengah, sendang",
                    "08:00 - 16:00",
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

  Widget _buildServiceItem(String title, String location, String time) {
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
                  color: Colors.indigo[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time,
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
              Icon(Icons.location_on, color: Colors.black),
              Text(
                location,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
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
