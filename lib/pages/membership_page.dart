import 'package:flutter/material.dart';

class MembershipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMembershipCard(
              context,
              'Basic Plan',
              'Membuka fitur pinjam buku dengan sewa normal',
              Colors.lightBlueAccent,
              'Gratis',
            ),
            SizedBox(height: 20),
            _buildMembershipCard(
              context,
              'Standard Plan',
              'Membuka fitur pinjam buku dengan diskon sewa sampai 50%\nBebas iklan',
              Colors.greenAccent,
              'Rp. 50.000',
            ),
            SizedBox(height: 20),
            _buildMembershipCard(
              context,
              'Premium Plan',
              'Membuka fitur pinjam buku tanpa biaya sewa\nBebas iklan',
              Colors.deepOrangeAccent,
              'Rp. 150.000',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipCard(
    BuildContext context,
    String title,
    String description,
    Color color,
    String buttonText,
  ) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
