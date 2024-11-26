import 'package:financify_wallet/shared/theme.dart';
import 'package:financify_wallet/ui/pages/home_page.dart';
import 'package:financify_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpSuccessPage extends StatelessWidget {
  const TopUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon atau ilustrasi sukses
              Container(
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(bottom: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/success_icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Judul utama
              Text(
                'Top Up\nWallet Berhasil',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Deskripsi
              Text(
                'Use the money wisely and\ngrow your finance',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Tombol "Get Started"
              CustomFilledButton(
                width: 200,
                title: 'Back to Home',
                onPressed: () {
                  Get.offAll(() => const HomePage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
