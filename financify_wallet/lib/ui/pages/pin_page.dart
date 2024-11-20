import 'package:financify_wallet/shared/theme.dart';
import 'package:financify_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 58,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha PIN',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  obscureText: true,
                  cursorColor: greyColor,
                  obscuringCharacter: '*',
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 66,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputButton(
                    title: '1',
                    onTap: () {},
                  ),
                  CustomInputButton(
                    title: '2',
                    onTap: () {},
                  ),
                  CustomInputButton(
                    title: '3',
                    onTap: () {},
                  ),
                  CustomInputButton(
                    title: '4',
                    onTap: () {},
                  ),
                  CustomInputButton(
                    title: '5',
                    onTap: () {},
                  ),
                  CustomInputButton(
                    title: '6',
                    onTap: () {},
                  ),
                  CustomInputButton(
                    title: '7',
                    onTap: () {},
                  ),
                  CustomInputButton(
                    title: '8',
                    onTap: () {},
                  ),
                  CustomInputButton(
                    title: '9',
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
