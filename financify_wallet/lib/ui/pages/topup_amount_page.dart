import 'package:financify_wallet/blocs/auth/auth_bloc.dart';
import 'package:financify_wallet/blocs/topup/topup_bloc.dart';
import 'package:financify_wallet/models/topup_form_model.dart';
import 'package:financify_wallet/shared/shared_method.dart';
import 'package:financify_wallet/shared/theme.dart';
import 'package:financify_wallet/ui/pages/pin_page.dart';
import 'package:financify_wallet/ui/pages/success_page.dart';
import 'package:financify_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopUpAmountPage extends StatefulWidget {
  final TopUpFormModel data;

  const TopUpAmountPage({
    super.key,
    required this.data,
  });

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text.replaceAll('.', '');
      if (text.isNotEmpty && RegExp(r'^\d+$').hasMatch(text)) {
        amountController.value = amountController.value.copyWith(
          text: NumberFormat.currency(
            locale: 'id',
            decimalDigits: 0,
            symbol: '',
          ).format(int.parse(text)),
        );
      } else {
        amountController.text = '0';
      }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TopupBloc(),
        child: BlocConsumer<TopupBloc, TopupState>(
            listener: (context, state) async {
          if (state is TopupFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is TopupSuccess) {
            final isLaunched = await launchUrl(
              Uri.parse(state.redirectUrl),
            );
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(
                    int.parse(
                      amountController.text.replaceAll('.', ''),
                    ),
                  ),
                );
            if (isLaunched) {
              Get.offAll(() => SuccessPage(
                    title: 'Top Up\nWallet Berhasil',
                  ));
            }
          }
        }, builder: (context, snapshot) {
          return ListView(
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
              CustomFilledButton(
                  title: 'Checkout Now',
                  onPressed: () async {
                    final result = await Get.to(() => const PinPage(),
                        arguments: {'clearPin': true});

                    if (result == true) {
                      final authState = context.read<AuthBloc>().state;
                      String pin = '';
                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }

                      context.read<TopupBloc>().add(
                            TopupPost(widget.data.copyWith(
                              pin: pin,
                              amount: amountController.text.replaceAll('.', ''),
                            )),
                          );
                    }
                  }),
              const SizedBox(height: 25),
              CustomTextButton(title: 'Terms & Conditions', onPressed: () {}),
              const SizedBox(height: 40),
            ],
          );
        }),
      ),
    );
  }
}
