import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../consig_dialog/consig_dialog.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(
      {Key? key,
      required this.cubit,
      required this.title,
      required this.minimumYear,
      required this.maximumYear,
      required this.initialDate})
      : super(key: key);
  final Cubit cubit;

  final String title;

  final int minimumYear;
  final int maximumYear;
  final DateTime initialDate;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog<void>(
          useSafeArea: true,
          context: context,
          builder: (BuildContext context) {
            return ConsigDialog(
                cubit: cubit,
                title: title,
                minimumYear: minimumYear,
                maximumYear: maximumYear,
                initialDate: initialDate);
          },
        );
      },
      icon: const Icon(
        Icons.date_range,
      ),
    );
  }
}
