import 'package:flutter/material.dart';
import 'package:cendikia/pages/Home_page.dart';
import 'package:cendikia/theme.dart';
import 'package:flutter/services.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: const SizedBox(
                      width: 75,
                      height: 75,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/ic_profile.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Halo Fachri',
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.person_add_alt_1_rounded,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('Tambahkan Akun',
                        style: blackTextStyle.copyWith(fontSize: 18)),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('Pengaturan',
                        style: blackTextStyle.copyWith(fontSize: 18)),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.key_rounded,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('Ganti Password',
                        style: blackTextStyle.copyWith(fontSize: 18)),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.shield_moon_rounded,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('Kebijakan Privasi',
                        style: blackTextStyle.copyWith(fontSize: 18)),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.web,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('Kunjungi Website Kami',
                        style: blackTextStyle.copyWith(fontSize: 18)),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: Colors.white),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Keluar',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}