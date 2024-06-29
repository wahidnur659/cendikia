import 'package:flutter/material.dart';

class RakBukuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rak Buku'),
        centerTitle: true, // Untuk menengahkan teks "Direktori"
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategorySection(
              title: 'Rak Buku Anda',
              books: [
                {
                  'title': 'Peterpan',
                  'image': 'assets/294ffcae-3dde-43e6-8375-ae7c9ab0edbd.jpg'
                },
                {
                  'title': '169 Fakta Asyik Tentang Bumi',
                  'image':
                      'assets/Buku_Pengetahuan_Anak_169__Fakta_Asyik_Tentang_Bumi___Tony_W.jpg'
                },
                {
                  'title': 'Perahu Kertas',
                  'image': 'assets/Cover-Buku-Novel-Perahu-Kertas.jpg'
                },
                {
                  'title': 'Bintang',
                  'image': 'assets/cover-novel-bintang-karya-tere-liye.jpg'
                },
                {
                  'title': 'Dasar Dasar Pengetahuan Ergonomi',
                  'image': 'assets/Dasar Dasar Pengetahuan Ergonomi.jpg'
                },
                {'title': 'Dune', 'image': 'assets/dune.jpg'},
                {
                  'title': 'Dunia yang Hilang',
                  'image': 'assets/dunia-yang-hilang.jpg'
                },
                {
                  'title': 'Ensiklopedia Pengetahuan Sosial',
                  'image': 'assets/Ensiklopedi-Pengetahuan-Sosial-Jilid-2.jpg'
                },
                {'title': 'Hamlet', 'image': 'assets/hamlet.jpg'},
                {
                  'title': 'Harry Potter and the Philosopher`s Stone',
                  'image': 'assets/harry-potter.jpg'
                },
                {
                  'title': 'Harry Potter and the Cursed Child',
                  'image':
                      'assets/harry-potter-dan-si-anak-terkutuk-harry-potter-and-the-cursed-child.jpg'
                },
                {
                  'title': 'Ilmu Pengetahuan dan Perilaku Manusia',
                  'image':
                      'assets/ILMU-PENGETAHUAN-DAN-PERILAKU-MANUSIA-001.jpg'
                },
                {
                  'title': 'Pelangi',
                  'image': 'assets/image-removebg-preview-50.jpg'
                },
                {
                  'title': 'Ayat-Ayat Cinta',
                  'image': 'assets/image-removebg-preview-51.jpg'
                },
                {'title': 'Solo Leveling', 'image': 'assets/Jang-Sung-lak.jpg'},
                {'title': 'Komet', 'image': 'assets/KOMET-TERE-LIYE.jpg'},
                {
                  'title': 'The Calculatin Stars',
                  'image': 'assets/LwnksW2MQGzzVpvDZwaoh5-970-80.jpg'
                },
                {'title': 'Mariposa', 'image': 'assets/mariposa.jpg'},
                {
                  'title': 'Negeri 5 Menara',
                  'image':
                      'assets/Novel_Negeri_5_Menara__Ahmad_Faudi__Buku_ORI__Soft_Cover.jpg'
                },
                {'title': '5 cm', 'image': 'assets/novel-5-cm.jpg'},
                {
                  'title': 'Bumi dan Bulan',
                  'image':
                      'assets/Paket_Novel_Bumi_Dan_Bulan___Tere_Liye__Books_shop.jpg'
                },
                {
                  'title': 'Percy Jackson and the Lightning Thief',
                  'image': 'assets/PJ-and-Lightning-Thief-Graphic-Novel.jpg'
                },
                {'title': 'Siti Nurbaya', 'image': 'assets/siti-nurbaya1.jpg'},
                {'title': 'The Hobbit', 'image': 'assets/the hobbit.jpg'},
                {
                  'title': 'The Beginning After the End',
                  'image': 'assets/the-beginning-after-the-end.jpg'
                },
                {
                  'title': 'Stephen King',
                  'image': 'assets/the-dark-tower-vii-9781416524526_hr.jpg'
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> books;

  CategorySection({required this.title, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
              height:
                  20), // Jarak antara teks "Direktori Buku Anda" dan gambar buku
          Center(
            child: Wrap(
              spacing: 16.0, // Spacing between items
              runSpacing: 16.0, // Spacing between rows
              alignment: WrapAlignment.center,
              children: books.map((book) {
                return Column(
                  children: [
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4.0,
                            offset: Offset(2, 2),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(book['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          book['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Container(
                              color: Colors.grey,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 10), // Jarak antara gambar dan teks judul buku
                    Container(
                      width: 100,
                      child: Text(
                        book['title']!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
