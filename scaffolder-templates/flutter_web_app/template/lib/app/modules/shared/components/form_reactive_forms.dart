import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jedi_app_base/jedi_app_base.dart';

import 'package:reactive_forms/reactive_forms.dart';

class FormReactiveForms extends StatefulWidget {
  const FormReactiveForms(
      {Key? key,
      required this.formControllerName,
      required this.labelText,
      this.inputType,
      required this.mask})
      : super(key: key);

  final String formControllerName;
  final String labelText;
  final TextInputType? inputType;
  final TextInputFormatter mask;

  @override
  State<FormReactiveForms> createState() => _FormReactiveFormsState();
}

class _FormReactiveFormsState extends State<FormReactiveForms> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 20),
        child: ReactiveTextField(
          validationMessages: (control) => {
            'required': 'Obrigatório',
            'pattern': 'Necessario nome e sobre nome',
            'minLength': 'Quantidade insuficiente de dígitos'
          },
          //TODO: make dynamic
          decoration: InputDecoration(
            hintText: widget.formControllerName == 'cellPhone'
                ? '(00) 9 0000-0000'
                : widget.formControllerName == 'cpf'
                    ? '000.000.000-00'
                    : widget.formControllerName == 'fullName'
                        ? 'Nome Completo'
                        : widget.formControllerName == 'enrollment'
                            ? 'Informe os 10 dígitos'
                            : '',
            labelText: widget.labelText,
            labelStyle: JdAppTheme.of(context)?.bodyTextStyle,
            fillColor: JdAppTheme.of(context)?.pageColor,
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          formControlName: widget.formControllerName,
          keyboardType: widget.inputType,
          inputFormatters: [widget.mask],
        ),
      ),
    );
  }
}
