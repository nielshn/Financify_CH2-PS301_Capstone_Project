import 'package:financify_wallet/shared/theme.dart';
import 'package:financify_wallet/ui/pages/sign_up_success_page.dart';
import 'package:financify_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpSetKtp extends StatelessWidget {
  const SignUpSetKtp({super.key});

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
                bottom: 100,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_logo_light.png'),
                ),
              ),
            ),
          ),
          Text(
            'Verify Your\n Account',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBackgroundColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/ic_upload.png',
                      width: 32,
                    ),
                  ),
                ),
                // Container(
                //   width: 120,
                //   height: 120,
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage(
                //         'assets/img_profile.png',
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Passport/ID Card',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomTextButton(
            title: 'Skip for Now',
            onPressed: () {
              Get.to(() => const SignUpSuccessPage());
            },
          ),
        ],
      ),
    );
  }
}
