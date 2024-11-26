import 'package:financify_wallet/shared/theme.dart';
import 'package:financify_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (Get.arguments?['clearPin'] == true) {
      pinController.clear();
    }
  }

  void addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text += number;
      });
      if (pinController.text == '123123') {
        Get.back(result: true);
      }
    }
  }

  void deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha PIN',
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(height: 72),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  enabled: false,
                  obscureText: true,
                  obscuringCharacter: '*',
                  cursorColor: greyColor,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
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
                      onTap: deletePin,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: numberBackgroundColor,
                        ),
                        child: Center(child: Icon(Icons.arrow_back, color: whiteColor)),
                      ),
                    );
                  }
                  return CustomInputButton(
                    title: index == 10 ? '0' : '${index + 1}',
                    onTap: () => addPin(index == 10 ? '0' : '${index + 1}'),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
