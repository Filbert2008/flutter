import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: const Text('Beranda'),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/Ellipse6.png'),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 24.0,
                  ),
                  width: double.infinity,
                  height: 217.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF003566),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'LaPak Bantul',
                              style: TextStyle(
                                fontSize: 28,
                                color: Color(0xFFE9E7E5),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Pusat Layanan Pajak Terpadu',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFE9E7E5),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.yellow[500],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: Image.asset(
                          'assets/images/Group10.png',
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              shrinkWrap: false,
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              children: [
                _buildMenuItem("PBB", Icons.description_rounded, const Color(0xFFDFE3E7)),
                _buildMenuItem(
                  "BPHTB",
                  Icons.description_rounded,
                  const Color(0xFFDFE3E7),
                ),
                _buildMenuItem(
                  "Rekap",
                  Icons.event_note_rounded,
                  const Color(0xFFDFE3E7),
                ),
                _buildMenuItem(
                  "Layanan Keliling",
                  Icons.local_shipping_rounded,
                  const Color(0xFFDFE3E7),
                ),
                _buildMenuItem(
                  "Informasi",
                  Icons.info_rounded,
                  const Color(0xFFDFE3E7),
                ),
                _buildMenuItem("Lainnya", Icons.grid_view_rounded, const Color(0xFFDFE3E7)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: const Color(0xFF003566)),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
