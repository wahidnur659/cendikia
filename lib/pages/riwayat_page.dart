import 'package:flutter/material.dart';

class Riwayat extends StatelessWidget {
  final List<Map<String, String>> borrowHistory = [
    {
      'title': 'Bintang',
      'borrowDate': '2023-01-15',
      'returnDate': '2023-02-15',
      'image': 'assets/cover-novel-bintang-karya-tere-liye.jpg'
    },
    {
      'title': 'Hamlet',
      'borrowDate': '2023-03-01',
      'returnDate': '2023-04-01',
      'image': 'assets/hamlet.jpg'
    },
    {
      'title': 'Negeri 5 Menara',
      'borrowDate': '2023-05-10',
      'returnDate': '2023-06-10',
      'image': 'assets/Novel_Negeri_5_Menara__Ahmad_Faudi__Buku_ORI__Soft_Cover.jpg'
    },
    {
      'title': 'Ilmu Pengetahuan',
      'borrowDate': '2023-07-20',
      'returnDate': '2023-08-20',
      'image': 'assets/ILMU-PENGETAHUAN-DAN-PERILAKU-MANUSIA-001.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Peminjaman Buku'),
      ),
      body: ListView.builder(
        itemCount: borrowHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              borrowHistory[index]['image']!,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            title: Text(borrowHistory[index]['title']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tanggal Peminjaman: ${borrowHistory[index]['borrowDate']}'),
                Text('Tanggal Pengembalian: ${borrowHistory[index]['returnDate']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
