import 'package:financify_wallet/shared/theme.dart';
import 'package:financify_wallet/ui/pages/pin_page.dart';
import 'package:financify_wallet/ui/pages/topup_success.dart';
import 'package:financify_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TopUpAmountPage extends StatefulWidget {
  const TopUpAmountPage({super.key});

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  final TextEditingController amountController = TextEditingController(
      text: '0');

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
          text: NumberFormat.currency(
            locale: 'id',
            decimalDigits: 0,
            symbol: '',
          ).format(int.parse(text.replaceAll('.', '')))
      );
    });
  }

  void addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text += number;
    });
  }

  void deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text.isEmpty) {
          amountController.text = '0';
        }
      });
    }
  }

  Future<void> handleCheckout() async {
    // Clear pin before navigating
    final result = await Get.to(() => const PinPage(),
        arguments: {'clearPin': true});
    if (result == true) {
      await launchUrlString('https://demo.midtrans.com/');
      Get.offAll(() => const TopUpSuccessPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        children: [
          const SizedBox(height: 60),
          Center(
            child: Text(
              'Total Amount',
              style: whiteTextStyle.copyWith(
                  fontSize: 20, fontWeight: semiBold),
            ),
          ),
          const SizedBox(height: 67),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                enabled: false,
                cursorColor: greyColor,
                style: whiteTextStyle.copyWith(
                    fontSize: 36, fontWeight: medium),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp',
                    style: whiteTextStyle.copyWith(
                        fontSize: 36, fontWeight: medium),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 66),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: List.generate(12, (index) {
              if (index == 9) return const SizedBox(width: 60, height: 60);
              if (index == 11) {
                return GestureDetector(
                  onTap: deleteAmount,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: numberBackgroundColor,
                    ),
                    child: Center(
                        child: Icon(Icons.arrow_back, color: whiteColor)),
                  ),
                );
              }
              return CustomInputButton(
                title: index == 10 ? '0' : '${index + 1}',
                onTap: () => addAmount(index == 10 ? '0' : '${index + 1}'),
              );
            }),
          ),
          const SizedBox(height: 50),
          CustomFilledButton(title: 'Checkout Now', onPressed: handleCheckout),
          const SizedBox(height: 25),
          CustomTextButton(title: 'Terms & Conditions', onPressed: () {}),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
