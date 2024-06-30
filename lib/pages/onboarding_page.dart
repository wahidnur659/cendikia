import 'package:flutter/material.dart';
import 'package:cendikia/pages/login_page.dart';
import 'package:cendikia/theme.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cendikia.png',
              width: 250,
              height: 400,
            ),
            const SizedBox(
              height: 20, // Reduced height to bring text closer to the image
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 28,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20, // Reduced vertical padding to bring text closer to the image
              ),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    'Baca buku membangun negeri\fyang sangat indah',
                    style: blackTextStyle.copyWith(
                        fontSize: 15, fontWeight: semiBold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    'Kalau kamu baca buku nanti kamu jadi\fPinter Loh Real no hoax mah kata gweh Mah',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30, // Reduced height to bring the button closer to the text
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Get Started',
                      style: whiteTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: semiBold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor2,
                      minimumSize: Size(256, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}