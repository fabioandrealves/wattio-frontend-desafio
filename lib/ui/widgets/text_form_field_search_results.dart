import 'package:desafio_frontend_wattio/ui/style/percentage_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../infra/cubit/account_value_cubit.dart';
import '../../infra/cubit/selected_offer_cubit.dart';
import '../../infra/provider/text_field_controller_provider.dart';
import '../style/text_styles.dart';

class TextFormFieldSearchResults extends StatelessWidget {
  const TextFormFieldSearchResults({super.key});

  double? _parsed({required String value}) {
    return double.tryParse(value);
  }

  TextStyle get _getTextFieldStyle =>
      TextStyles.textDarkOnSurface(fontSize: 18, fontWeight: FontWeight.bold);

  Widget _buildSearchTextField({
    required BuildContext context,
    required TextFieldControllerProvider textFieldControllerProvider,
  }) {
    return BlocListener<AccountValueCubit, double>(
      listener: (context, accountValue) {
        textFieldControllerProvider.updateText(accountValue);
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 85.00.percent(),
        child: Semantics(
          label: "Campo de pesquisa",
          hint: "Digite aqui para pesquisar cooperativas",
          textField: true,
          child: TextFormField(
            autofocus: true,
            controller: textFieldControllerProvider.controller,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (_parsed(value: value) != null) {
                context.read<AccountValueCubit>().updateValue(
                  _parsed(value: value)!,
                );
                context.read<SelectedOfferCubit>().selectOffer(null);
              }
            },
            style: _getTextFieldStyle,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              labelText: 'Digite o valor em R\$:',
              labelStyle: _getTextFieldStyle,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textFieldControllerProvider =
        Provider.of<TextFieldControllerProvider>(context);
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: screenSize.width * 10.00.percent()),
            _buildSearchTextField(
              context: context,
              textFieldControllerProvider: textFieldControllerProvider,
            ),
          ],
        ),
        //   CardResult(context: context, search: searchPlaces),
      ],
    );
  }
}
