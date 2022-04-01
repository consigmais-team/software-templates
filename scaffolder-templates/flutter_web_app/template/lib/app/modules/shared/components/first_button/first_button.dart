import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../colors/colors.dart';

class FirstButton extends StatelessWidget {
  FirstButton(
      {Key? key,
      required this.onpressed,
      required this.title,
      required this.btnController,
      this.color})
      : super(key: key);
  final Function()? onpressed;
  final String title;
  final RoundedLoadingButtonController btnController;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoundedLoadingButton(
        color: color ?? secondBlue,
        onPressed: onpressed,
        child: SizedBox(
          height: 60,
          width: 300,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        controller: btnController,
      ),
    );
  }
}
