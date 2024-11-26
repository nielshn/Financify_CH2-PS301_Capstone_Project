import 'package:financify_wallet/shared/theme.dart';
import 'package:financify_wallet/ui/pages/transfer_amount_page.dart';
import 'package:financify_wallet/ui/widgets/buttons.dart';
import 'package:financify_wallet/ui/widgets/forms.dart';
import 'package:financify_wallet/ui/widgets/transfer_recent_user_item.dart';
import 'package:financify_wallet/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          buildResult(),
          const SizedBox(
            height: 274,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Get.to(() => const TransferAmountPage());
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Yonna Jie',
            username: '@yoenna',
            isVerified: true,
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend2.png',
            name: 'John Hi',
            username: '@johnhi',
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'Rifqi Eka',
            username: '@rifqi',
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: const [
              TransferResultUserItem(
                imageUrl: 'assets/img_friend1.png',
                name: 'Yonna Jie',
                username: '@yoenna',
                isVerified: true,
              ),
              TransferResultUserItem(
                imageUrl: 'assets/img_friend2.png',
                name: 'Yonne Ka',
                username: '@yoenyu',
                isSelected: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
