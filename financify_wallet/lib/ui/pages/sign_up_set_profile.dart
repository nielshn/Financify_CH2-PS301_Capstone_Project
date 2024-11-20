import 'package:financify_wallet/shared/theme.dart';
import 'package:financify_wallet/ui/pages/sign_up_set_ktp.dart';
import 'package:financify_wallet/ui/widgets/buttons.dart';
import 'package:financify_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpSetProfile extends StatelessWidget {
  const SignUpSetProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Center(
            child: Container(
              width: 155,
              height: 50,
              margin: const EdgeInsets.only(
                top: 100,
                bottom: 50,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_logo_light.png'),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Join Us to Unlock\nYour Growth',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Container utama untuk form dan profil
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar profil di tengah
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/img_profile.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // Nama profil
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                // Form untuk PIN
                const CustomFormField(
                  title: 'Set PIN (6 digit number)',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                // Tombol lanjutkan
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Get.to(() => const SignUpSetKtp());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
